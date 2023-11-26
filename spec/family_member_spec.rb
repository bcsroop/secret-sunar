require 'family_member'

describe 'FamilyMember' do
	
	let(:family_member) { FamilyMember.new("Mum", 1234, ["Dad"]) }

	it 'has a name' do
		expect(family_member.name).to eq("Mum")
	end

	it 'has a phone number' do
		expect(family_member.phone).to eq(1234)
	end

	it 'has a list of exclusions that includes themself' do
		expect(family_member.exclusions).to eq(['Dad', 'Mum'])
	end

	it 'has a giftee that is initially empty' do
		expect(family_member.giftee).to eq(nil)
	end

	it 'can be assigned a giftee' do
		sroop = FamilyMember.new("Sroop", 222, ["Jean-Jacques"])
		family_member.giftee=sroop
		expect(family_member.giftee).to eq(sroop)
	end

	it 'returns a list of giftee options' do
		sroop = FamilyMember.new("Sroop", 222, ["Jean-Jacques"])
		jj = FamilyMember.new("Jean-Jacques", 222, ["Sroop"])
		dad = FamilyMember.new("Dad", 222, ["Mum"])
		family = [family_member, sroop, jj, dad]

		expect(family_member.giftee_options(family)).to eq([sroop, jj])
	end

end