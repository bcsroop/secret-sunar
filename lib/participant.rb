class Participant

	attr_reader(:name, :phone, :giftee, :exclusions)

	def initialize(name, phone, exclusion)
		@name = name
		@phone = phone
		@exclusions = [exclusion, name]
		@giftee = nil
	end

	def pick_from(hat)
		possible_giftees = valid_options(hat)
		raise DrawingError.new if possible_giftees.empty?
		@giftee = possible_giftees.shuffle.sample
	end

	def valid_options(hat)
		hat.reject do |participant|
			exclusions.include?(participant.name)
		end
	end

	def notification
		return "Reach out to Sroop - something went wrong!" unless giftee
		"Thanks for playing *Secret Sunar*! You are gifting #{giftee.name} a christmas present. Remember to keep it a secret, and the budget is £100."
	end

	class DrawingError < StandardError;end
end