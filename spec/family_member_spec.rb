require 'family_member'

describe 'FamilyMember' do
	
	let(:family_member) { FamilyMember.new("Mum", 1234, ["Dad"]) }

	it 'has a name' do
		expect(family_member.name).to eq("Mum")
	end

	it 'has a phone number' do
		expect(family_member.phone).to eq(1234)
	end

	it 'had a list of illegal targets' do
		expect(family_member.illegal_targets).to eq(['Dad'])
	end

end