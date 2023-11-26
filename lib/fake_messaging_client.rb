class FakeMessagingClient
	
	def send!(message, phone_number)
		"[#{phone_number}]: #{message}"
	end

end
