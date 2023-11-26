class FamilyMember
	attr_reader(:name, :phone, :exclusions)
	attr_accessor(:giftee)
	def initialize(name, phone, exclusions)
		@name = name
		@phone = phone
		@exclusions = exclusions.append(name)
		@giftee = nil
	end

	def giftee_options(family)
		family.reject do |member|
			exclusions.include?(member.name)
		end
	end

end