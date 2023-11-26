class SecretSunar

	attr_reader(:family)

	def initialize(family)
		@family = family
	end

	def new_messaging_client
		# MessagingClient.new
	end

	def draw_names
		family.reduce(family) do |hat, member|
			chosen = member.pick_from(hat)
			hat.reject{|fam| fam.name == chosen.name}
		end
	end

	def notify_family!
		messaging_client = new_messaging_client
		family.map do |member|
			messaging_client.send!(member.notification, member.phone)
		end
	end

end
