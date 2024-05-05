extends StaticBody2D
#im gonna try to use toolscript , setters/getters
#so i would have an enum for all the colored keys and doors
#so i dont create 10 thousand scripts for all colors
#but curently it seems very hard and i couldnt find a good enough source


var animation

func _ready():
	animation = get_node("AnimationPlayer")
	


## if hitbox detect open door detects body
func _on_hitbox_area_body_entered(body):
	if self.name in GlobalKeys.key_founded:
		animation.play("Open")
	else:
		animation.play("Closed")

## if animation is Open and it ended delete the door, instead of deleting i would change its layer 
##and play a different sprite depending on the art i have 
## but i would rather learn to code and understand the engine better than searching and creating assets
## those are just tehnicalities

func _on_animation_player_animation_finished(animation_name):
	if animation_name == "Open":
		queue_free()
