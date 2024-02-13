extends CanvasLayer


@onready var HintForGame = preload("res://scenes/start_hint_for_game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_continue_pressed():
	hide()


func _on_menu_pressed():
	Globals.interviewScore = 0
	get_tree().change_scene_to_file("res://scenes/game_menu.tscn")
	
#func _input(event):
#	if event.is_action_pressed("menu"):
#		show()


func _on_hints_for_game_pressed():
	var HintForGame_instantiate = HintForGame.instantiate()
	var Game = get_tree().get_root().get_node("Game")
	Game.add_child(HintForGame_instantiate)
	
