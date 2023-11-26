require 'participant'

describe 'Participant' do
	
	let(:mum) { Participant.new("Mum", 1234, "Dad") }

	it 'has a name' do
		expect(mum.name).to eq("Mum")
	end

	it 'has a phone number' do
		expect(mum.phone).to eq(1234)
	end

	it 'has a list of exclusions, including themselves' do
		expect(mum.exclusions).to eq(['Dad', 'Mum'])
	end

	it 'has a giftee that is initially empty' do
		expect(mum.giftee).to eq(nil)
	end

	describe 'Picking a giftee from a hat' do
		let(:sroop) { Participant.new("Sroop", 222, "JJ") }
		let(:jj) { Participant.new("JJ", 222, "Sroop") }
		let(:dad) { Participant.new("Dad", 222, "Mum") }

		it 'returns a list of valid options from the hat' do
			expect(mum.valid_options([mum, dad, sroop, jj])).to eq([sroop, jj])
		end

		it 'picks a giftee from the list of options' do
			mum.pick_from([mum, sroop, dad])

			expect(mum.giftee).to eq(sroop)
		end

		it 'raises an error if there are no names to pick' do
			expect { mum.pick_from([mum, dad]) }.to raise_error(Participant::DrawingError)
		end

		it 'generates a notification message when a giftee is picked' do
			mum.pick_from([mum, dad, jj])
			expect(mum.notification).to match("Thanks for playing *Secret Sunar*! You are gifting JJ a christmas present. Remember to keep it a secret, and the budget is £100.")
		end

		it 'generates a different notification message when there is no giftee' do
			expect(mum.notification).to eq("Reach out to Sroop - something went wrong!")
		end

	end

end