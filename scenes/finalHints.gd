extends CanvasLayer



const GOOD_LABEL = "А теперь еще несколько советов"
const BAD_LABEL = "Вот несколько советов, которые стоит учесть"

@onready var label = $VBoxContainer/LabelForTips


func _ready():
	if Globals.interviewScore < Globals.MIN_SCORE:
		label.text = BAD_LABEL
	else:
		label.text = GOOD_LABEL



func _on_next_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game_raiting.tscn")
