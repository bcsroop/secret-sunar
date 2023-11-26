# Secret Sunar
**A simple secret santa program for Sunar family fun!**

```
       ____
     {} _  \
        |__ \
       /_____\
       \o o)\)_______
       (<  ) /#######\
     __{'~` }#########|
    /  {   _}_/########|
   /   {  / _|#/ )####|
  /   \_~/ /_ \  |####|
  \______\/  \ | |####|
   \__________\|/#####|
    |__[X]_____/ \###/ 
    /___________\
     |    |/    |
     |___/ |___/
    _|   /_|   /
   (___,_(___,_)
```

### How it works

Require all the files:
```
require_relative('lib/secret_sunar.rb')
require_relative('lib/participant.rb')
require_relative('lib/messaging_client.rb')
```

Setup your participant data in `config/secrets.yml` using the following structure:
```
participants:
  - name: "Mum"
    phone: "+44111"
    exclusion: "Dad"
  - name: "Dad"
    phone: "+44222"
    exclusion: "Mum"
  - name: ...
```
Each participant won't be allowed to pick themselves, and they can also name one person they want to exclude from their pick of the hat, using the `exclusions` key. This is setup in a way so that participants don't end up picking their partners (yes this program is biased towards couples - sorry!). Just make sure the names don't have typos, and that any named exclusions are spelled correctly and correspond to a participant's name!

Create your participants, a messaging client and the secret sunar program:
```
secrets = YAML.load_file('config/secrets.yml')
participant_data = secrets["participants"]
participants = participant_data.map do |data|
   Participant.new(data["name"], data["phone"], data["exclusion"])
end

messaging_client = MessagingClient.new
secret_sunar = SecretSunar.new(participants, messaging_client)
```

Then finally, draw names and fire off text messages to everyone to let them know who their giftee is:
```
secret_sunar.draw_names
secret_sunar.notify_participants!
```

### Twilio setup

Login to Twilio, create a new project, then create `config/secrets.yml` containing a `account_sid`, `auth_token` and `twilio_number`. For each participant in Secret Sunar, you will need to verify their phone number first as I'm only using a free trial here. Add each phone number into the "Verified Caller IDs" section of Twilio's UI, and then ask each participant to send you the verification code that Twilio sends to them in a text message. Once each phone number is verified, you can run the program!


