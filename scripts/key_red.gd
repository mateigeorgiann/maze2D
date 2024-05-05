extends Node2D

##If key was taken before dont spawn it again
func _ready():
	##print(GlobalKeys.key_founded)
	if self.name in GlobalKeys.key_founded:
		queue_free()
		
##If you take key, delete it and add it to the array where the key names that were taken will be kept
##This way you can have multiple red keys with for example _1 , _2 , _dungeon , etc at the end 
##I thought about maybe adding a way of painting the keys inside the tilemap but it seems really complicated to add 
## a way to automatically name , maybe something like rename with _n where n=n+1 everytime you call it

func _on_area_2d_body_entered(body):
	##thank you for the clutch internet i would have never guessed that there was a function that did this
	## i was about to create more variables and use different functions to only safe up to _key
	##bassically it takes the nme of the key , and it cuts the last 4 characters "_key"
	
	var doorName = self.name.substr(0, self.name.length()- 4)
	GlobalKeys.key_founded.append(doorName)
	queue_free()
	##print(GlobalKeys.key_founded)
