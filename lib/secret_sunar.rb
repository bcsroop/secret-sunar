class SecretSunar

	attr_reader(:family)

	def initialize(family)
		@family = family
		@messaging_client = messaging_client
	end

	def messaging_client
		TextMessage.new
	end

end