require 'secret_sunar'

describe 'SecretSunar' do

	let(:mum) { double(:family_member, name: "Mum", phone: 111, exclusions: ["Dad"]) }
	let(:sroop) { double(:family_member, name: "Sroop", phone: 222, exclusions: ["Jean-Jacques"]) }
	let(:secret_sunar) { SecretSunar.new([mum, sroop]) }

	
	it 'has family members' do
		expect(secret_sunar.family).to eq([mum, sroop])
	end

	it 'draws names for each family member' do
		jj = double(:family_member, name: "JJ", phone: 111, exclusions: ["Sroop"])
		dad = double(:family_member, name: "Dad", phone: 111, exclusions: ["Mum"])


		secret_sunar = SecretSunar.new([mum, sroop, jj, dad])
		# expect { secret_sunar.draw_names }.not_to raise_error
	end

end