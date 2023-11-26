require 'secret_sunar'

describe 'SecretSunar' do
	
	let(:mum) { double :family_member, name: "Mum", phone: 111, exclusions: ["Dad"] }
	let(:sroop) { double :family_member, name: "Sroop", phone: 222, exclusions: ["Jean-Jacques"] }
	let(:secret_sunar) { SecretSunar.new([mum, sroop]) }

	it 'has family members' do
		family = secret_sunar.family
		expect(family).to eq([mum, sroop])
	end

	

end