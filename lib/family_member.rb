class FamilyMember
	attr_reader(:name, :phone, :exclusions)
	attr_accessor(:giftee)
	def initialize(name, phone, exclusions)
		@name = name
		@phone = phone
		@exclusions = exclusions
		@giftee = nil
	end

end