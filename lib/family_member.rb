class FamilyMember
	attr_reader(:name, :phone, :illegal_targets)
	def initialize(name, phone, illegal_targets)
		@name = name
		@phone = phone
		@illegal_targets = illegal_targets
	end
end