class SecretSunar

	attr_reader(:family)

	def initialize(family)
		@family = family
		@messaging_client = messaging_client
	end

	def messaging_client
		# TextMessage.new
	end

	def draw_names
		family.reduce(family) do |available_family_options, member|
			giftee = member.pick_from(available_family_options)
			available_family_options.reject{|m| m.name == giftee.name}
		end
	end

end