Events with a mean time to happen build up and create a not-small amount of lag. A large portion of such events in EoaNB are just events that are supposed to fire near a specific date.
It is way better to, instead, fire it on startup in a specific amount of days. It still allows you to fire around a specific date in a range of days too.
The events are put to trigger in common/on_actions/on_startup_events.txt as to not clutter the other files. 

This program allows you to easily calculate the amount of days between each start date and the event. 
To speed the progress up, just pressing enter without entering a number in the range prompt will assume a range of 100 days.