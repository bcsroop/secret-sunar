class SecretSunar

	attr_reader(:participants, :messaging_client)

	def initialize(participants, messaging_client=nil)
		@participants = participants
		@messaging_client = messaging_client
	end

	def draw_names
		begin
			participants.shuffle.reduce(participants) do |hat, participant|
				chosen = participant.pick_from(hat)
				hat.reject{|fam| fam.name == chosen.name}
			end
		rescue Participant::DrawingError
			puts "Something went wrong with the draw, trying again.."
			draw_names
		end
	end

	def notify_participants!
		return unless messaging_client
		participants.map do |participant|
			messaging_client.send!(participant.notification, participant.phone)
		end
	end

end
