class SecretSunar

	attr_reader(:family, :messaging_client)

	def initialize(family, messaging_client=nil)
		@family = family
		@messaging_client = messaging_client
	end

	def draw_names
		family.reduce(family) do |hat, member|
			chosen = member.pick_from(hat)
			hat.reject{|fam| fam.name == chosen.name}
		end
	end

	def notify_family!
		family.map do |member|
			messaging_client.send!(member.notification, member.phone)
		end
	end

end
