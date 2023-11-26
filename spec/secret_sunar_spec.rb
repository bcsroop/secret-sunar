require 'secret_sunar'

describe 'SecretSunar' do

	let(:mum) { double(:family_member, name: "Mum", phone: 111, exclusions: ["Dad"], notification: "Notification") }
	let(:sroop) { double(:family_member, name: "Sroop", phone: 222, exclusions: ["Jean-Jacques"], notification: "Notification") }

	it 'has family members' do
		secret_sunar = SecretSunar.new([mum, sroop])
		expect(secret_sunar.family).to eq([mum, sroop])
	end

	it 'does not have a messaging client on init' do 
		secret_sunar = SecretSunar.new([mum, sroop])
		expect(secret_sunar.messaging_client).to eq(nil)
	end

	it 'has a messaging client on init' do 
		messaging_client = double(:messaging_client)
		secret_sunar = SecretSunar.new([mum, sroop], messaging_client)
		expect(secret_sunar.messaging_client).to eq(messaging_client)
	end

	it 'sends a text message to each family member, notifying them of their giftee' do
		messaging_client = double(:messaging_client, send!: "Sent!")
		secret_sunar = SecretSunar.new([mum, sroop], messaging_client)
		expect(secret_sunar.notify_family!).to eq(["Sent!", "Sent!"])
	end

	# it 'draws names for each family member' do
	# 	jj = double(:family_member, name: "JJ", phone: 111, exclusions: ["Sroop"])
	# 	dad = double(:family_member, name: "Dad", phone: 111, exclusions: ["Mum"])


	# 	secret_sunar = SecretSunar.new([mum, sroop, jj, dad])
	# 	# expect { secret_sunar.draw_names }.not_to raise_error
	# end

end