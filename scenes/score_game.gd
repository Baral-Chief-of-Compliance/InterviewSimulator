extends CanvasLayer


@export var StarReaction : PackedScene
@export var SadReaction : PackedScene

@onready var label = $Control/VBoxContainer/MarginContainer/VBoxContainer/Result
@onready var scroreText = $Control/VBoxContainer/MarginContainer/VBoxContainer/Score
@onready var timerApairButton = $ApairButton
@onready var buttonNext = $Control/VBoxContainer2/MarginContainer/Button
# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.interviewScore < Globals.MIN_SCORE:
		scroreText.text = str(Globals.interviewScore)
		label.text = "К сожалению, вы не прошли собеседование"
		var _sadReaction = SadReaction.instantiate()
		_sadReaction.position = $Control/VBoxContainer/MarginContainer/VBoxContainer/ReactionPoint.global_position
		_sadReaction.emitting = true
		$Control/VBoxContainer/MarginContainer/VBoxContainer/ReactionPoint.add_child(_sadReaction)
		
	elif Globals.interviewScore >= Globals.MIN_SCORE and Globals.interviewScore <= Globals.MAX_SCORE:
		scroreText.text = str(Globals.interviewScore)
		label.text = "Поздравляю, вы прошли собеседование"
		var _starReaction = StarReaction.instantiate()
		_starReaction.position = $Control/VBoxContainer/MarginContainer/VBoxContainer/ReactionPoint.global_position
		_starReaction.emitting = true
		$Control/VBoxContainer/MarginContainer/VBoxContainer/ReactionPoint.add_child(_starReaction)
		
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
	get_tree().change_scene_to_file("res://scenes/finalHints.tscn")


func _on_animation_player_animation_finished(anim_name):
	$cover.queue_free()
	
