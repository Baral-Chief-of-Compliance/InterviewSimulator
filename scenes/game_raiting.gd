extends CanvasLayer


@onready var ButtonNext = $Control/MarginContainer/VBoxContainer2/VBoxContainer2/ButtonNext

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	



func _on_one_pressed():
	Globals.scoreFromUser = 1
	ButtonNext.show()
	

func _on_two_pressed():
	Globals.scoreFromUser = 2
	ButtonNext.show()

func _on_three_pressed():
	Globals.scoreFromUser = 3
	ButtonNext.show()
	
func _on_four_pressed():
	Globals.scoreFromUser = 4
	ButtonNext.show()
	
func _on_five_pressed():
	Globals.scoreFromUser = 5
	ButtonNext.show()


func _on_button_next_pressed():
	get_tree().change_scene_to_file("res://scenes/game_menu.tscn")
