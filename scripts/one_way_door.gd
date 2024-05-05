extends StaticBody2D

#if the player gets in the hitbox, it changes the layer so it becomes a solid object

func _on_door_hitbox_body_entered(body):
	set_collision_layer_value(3,true)
	
