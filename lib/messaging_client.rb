require 'rubygems'
require 'twilio-ruby'
require 'yaml'

class MessagingClient

	attr_reader(:from_number)
	def initialize
		secrets = YAML.load_file('config/secrets.yml')
		@client = Twilio::REST::Client.new(
			secrets["account_sid"],
			secrets["auth_token"]
		)
		@from_number = secrets["twilio_number"]
	end

	def send!(message, phone_number)
		message = client.messages.create(
			:body => message,
			:to => phone_number,
			:from => from_number
		)
		message.sid
	end

end