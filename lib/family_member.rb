class FamilyMember
	attr_reader(:name, :phone, :exclusions)
	def initialize(name, phone, exclusions)
		@name = name
		@phone = phone
		@exclusions = exclusions
	end
end