class Participant
	attr_reader(:name, :phone, :giftee, :exclusions)
	def initialize(name, phone, partner_name)
		@name = name
		@phone = phone
		@exclusions = [partner_name, name]
		@giftee = nil
	end

	def pick_from(hat)
		possible_giftees = valid_options(hat)
		raise "something went wrong!" if possible_giftees.empty?
		@giftee = possible_giftees.shuffle.sample
	end

	def valid_options(hat)
		hat.reject do |participant|
			exclusions.include?(participant.name)
		end
	end

	def notification
		return unless giftee
		"Thanks for playing 'Secret Sunar'! You are gifting #{giftee.name} a christmas present. Remember to keep it a secret."
	end

end