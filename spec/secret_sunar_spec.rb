require 'secret_sunar'

describe 'SecretSunar' do

	before do
		allow_any_instance_of(SecretSunar).to receive(:messaging_client).and_return("something")
	end
	
	it 'has family members' do
		mum = double(:family_member, name: "Mum", phone: 111, exclusions: ["Dad"])
		sroop = double(:family_member, name: "Sroop", phone: 222, exclusions: ["Jean-Jacques"])
		secret_sunar = SecretSunar.new([mum, sroop])
		family = secret_sunar.family
		expect(family).to eq([mum, sroop])
	end

end