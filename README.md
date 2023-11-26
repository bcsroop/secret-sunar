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

Setup your participant data using the following structure:
```
participant_data = [
	{name: "Mum", phone: "11111", exclusion: "Dad"},
	{name: "Dad", phone: "22222", exclusion: "Mum"},
	...
]
```
Each participant won't be allowed to pick themselves, and they can also name one person they want to exclude from their pick of the hat. This is setup in a way so that participants don't end up picking their partners (yes this program is biased towards couples - sorry!). Just make sure the names don't have typos, and that any named exclusions are spelled correct and correspond to a participant's name!

Create your participants, a messaging client and the secret sunar program:
```
participants = participant_data.map do |data|
	Participant.new(data[:name], data[:phone], data[:exclusion])
end
messaging_client = MessagingClient.new
secret_sunar = SecretSunar.new(participants, messaging_client)
```

Then finally, draw names and fire off text messages to everyone to let them know who their giftee is:
```
secret_sunar.draw_names
secret_sunar.notify_participants!
```



