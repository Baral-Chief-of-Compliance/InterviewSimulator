extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_continue_pressed():
	hide()


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/game_menu.tscn")
	
#func _input(event):
#	if event.is_action_pressed("menu"):
#		show()
