class SecretSunar

	attr_reader(:participants, :messaging_client)

	def initialize(participants, messaging_client=nil)
		@participants = participants
		@messaging_client = messaging_client
	end

	def draw_names
		participants.reduce(participants) do |hat, member|
			chosen = member.pick_from(hat)
			hat.reject{|fam| fam.name == chosen.name}
		end
	end

	def notify_participants!
		return unless messaging_client
		participants.map do |member|
			messaging_client.send!(member.notification, member.phone)
		end
	end

end
