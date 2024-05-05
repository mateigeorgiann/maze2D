extends Area2D

##it check if the body is a player, it takes the current scene name , and because my naming convention is
##level_0 , level_1, etc it will automatically switch to the next one. 
## a really nice tutorial helped me with this

func _on_body_entered(body):
	if body.is_in_group("player"):
		var current_scene_file = get_tree().current_scene.scene_file_path
		print(current_scene_file)
		print(current_scene_file.to_int())
		var next_level_number = current_scene_file.to_int() + 1
		print(next_level_number)
		var next_level_path = "res://levels/level_" + str(next_level_number) + ".tscn"
		var level_name = get_tree().current_scene.name
		print(level_name)
		##The level number is saved .
		##in this function , the level that was finnished is saved , and it takes he number and take the player
		##automatically to the next one , a few more lines would let the player choose to continue or not after
		##finnishing a level . 
		level_name = level_name.to_int()
		print(level_name)
		GlobalKeys.level_cleared.append(level_name )
		GlobalKeys.levelCleared.emit(level_name)
		print(GlobalKeys.level_cleared)
		
		if next_level_number != 3:
			get_tree().change_scene_to_file(next_level_path)
		else:
			get_tree().change_scene_to_file("res://scenes/hud.tscn")
