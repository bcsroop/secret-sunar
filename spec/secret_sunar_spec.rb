require 'secret_sunar'

describe 'SecretSunar' do
	
	let(:secret_sunar) { SecretSunar.new }

	it 'has all family members' do
		expect(secret_sunar.family).to eq([])
	end

end