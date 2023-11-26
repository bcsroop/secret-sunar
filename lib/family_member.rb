class FamilyMember
	attr_reader(:name, :phone, :giftee, :exclusions)
	def initialize(name, phone, exclusions)
		@name = name
		@phone = phone
		@exclusions = exclusions.append(name)
		@giftee = nil
	end

	def pick_from(family)
		possible_giftees = giftee_options(family)
		raise "something went wrong!" if possible_giftees.empty?
		@giftee = possible_giftees.shuffle.sample
	end

	def giftee_options(family)
		family.reject do |member|
			exclusions.include?(member.name)
		end
	end

end