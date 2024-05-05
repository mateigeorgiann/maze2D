extends Node2D


#THE HUD, here you can play start and have a popup menu for multiple levels.

func _ready():
	var menuButton= $MenuButton
	var popup=menuButton.get_popup()
	popup.id_pressed.connect(level_name)
	GlobalKeys.levelCleared.connect(levelAvailable) 
	
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")

##for the menuButtoon it uses the same tehnique like in the next_level scene.
func level_name(id):
	var level = id + 1
	var levelPath = "res://levels/level_" + str(level) + ".tscn"
	get_tree().change_scene_to_file(levelPath)

##im really tired i really dont understand why it doesnt enter the function , but this would allow for
##the game to remember and let the player choose unlocked levels
func levelAvailable(level :int) -> void:
	print('This level is available', level-1)
	$MenuButton.get_popup().set_item_disabled(level-1,false)




