require 'secret_sunar'
require 'fake_messaging_client'

describe 'SecretSunar' do

	let(:mum) { double(:family_member, name: "Mum", phone: "111", exclusions: ["Dad"], notification: "Buy a gift for Sroop") }
	let(:sroop) { double(:family_member, name: "Sroop", phone: "222", exclusions: ["Jean-Jacques"], notification: "Buy a gift for mum") }

	it 'has participants' do
		secret_sunar = SecretSunar.new([mum, sroop])
		expect(secret_sunar.participants).to eq([mum, sroop])
	end

	it 'does not have a messaging client on init' do 
		secret_sunar = SecretSunar.new([mum, sroop])
		expect(secret_sunar.messaging_client).to eq(nil)
	end

	it 'does not notify participants without a messaging client' do 
		secret_sunar = SecretSunar.new([mum, sroop])
		expect(secret_sunar.notify_participants!).to eq(nil)
	end

	it 'has a messaging client on init' do 
		messaging_client = double(:messaging_client)
		secret_sunar = SecretSunar.new([mum, sroop], messaging_client)
		expect(secret_sunar.messaging_client).to eq(messaging_client)
	end

	it 'sends a text message to each participant, notifying them of their giftee' do
		messaging_client = FakeMessagingClient.new
		secret_sunar = SecretSunar.new([mum, sroop], messaging_client)
		expect(secret_sunar.notify_participants!).to eq([
			"[111]: Buy a gift for Sroop",
			"[222]: Buy a gift for mum"
		])
	end

	# it 'draws names for each family member' do
	# 	jj = double(:family_member, name: "JJ", phone: 111, exclusions: ["Sroop"])
	# 	dad = double(:family_member, name: "Dad", phone: 111, exclusions: ["Mum"])


	# 	secret_sunar = SecretSunar.new([mum, sroop, jj, dad])
	# 	# expect { secret_sunar.draw_names }.not_to raise_error
	# end

end