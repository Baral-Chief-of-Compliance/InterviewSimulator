extends CanvasLayer


@onready var label = $Control/VBoxContainer/MarginContainer/Label
@onready var timerApairButton = $ApairButton
@onready var buttonNext = $Control/VBoxContainer2/MarginContainer/Button
# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.interviewScore < Globals.MIN_SCORE:
		label.text = "Мы вам перезвоним"
	elif Globals.interviewScore >= Globals.MIN_SCORE and Globals.interviewScore <= Globals.MAX_SCORE:
		label.text = "Поздравляю вы прошли собеседование"
		$blue.show()
		$darkblue.show()
		$red.show()
		
		
	timerApairButton.wait_time = 3
	timerApairButton.start()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_apair_button_timeout():
	buttonNext.show()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game_raiting.tscn")


func _on_animation_player_animation_finished(anim_name):
	$cover.queue_free()
	
