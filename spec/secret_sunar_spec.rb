require 'secret_sunar'

describe 'SecretSunar' do
	
	let(:secret_sunar) { SecretSunar.new }

	it 'has all family members' do
		family = secret_sunar.family
		expect(family).to eq([])
	end

end