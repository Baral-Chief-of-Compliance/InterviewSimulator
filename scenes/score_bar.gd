extends CanvasLayer


@export var StarReaction : PackedScene
@export var SadReaction : PackedScene
@export var GoodReaction : PackedScene


@onready var progressBar = $MarginContainer/HBoxContainer/VBoxContainer2/ProgressBar
@onready var StarTimer = $StarTimer
@onready var SadTimer = $SadTimer
@onready var GoodTimer = $GoodTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	progressBar.max_value = Globals.MAX_SCORE
	progressBar.value = Globals.interviewScore


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func update_score(emotionalColor):
	if emotionalColor == Globals.SMILE:
		$MarginContainer/HBoxContainer/VBoxContainer/StarTurnOff.texture=ResourceLoader.load("res://sprites/scoreSymbols/star.png")
		var _starReaction = StarReaction.instantiate()
		_starReaction.position = $MarginContainer/HBoxContainer/VBoxContainer/StarTurnOff.global_position
		_starReaction.emitting = true
		$MarginContainer/HBoxContainer/VBoxContainer.add_child(_starReaction)
		StarTimer.start()
		
	if emotionalColor == Globals.SHOCKED or emotionalColor == Globals.SAD:
		$MarginContainer/HBoxContainer/VBoxContainer/SadTurnOff.texture = ResourceLoader.load("res://sprites/scoreSymbols/SadSmile2.png")
		var _sadReaction = SadReaction.instantiate()
		_sadReaction.position = $MarginContainer/HBoxContainer/VBoxContainer/SadTurnOff.global_position
		_sadReaction.emitting = true
		$MarginContainer/HBoxContainer/VBoxContainer.add_child(_sadReaction)
		SadTimer.start()
		
	if emotionalColor == Globals.DELIGHTED:
		$MarginContainer/HBoxContainer/VBoxContainer/GoodTurnOff.texture = ResourceLoader.load("res://sprites/scoreSymbols/GoodSmile2.png")
		var _goodReaction = GoodReaction.instantiate()
		_goodReaction.position = $MarginContainer/HBoxContainer/VBoxContainer/GoodTurnOff.global_position
		_goodReaction.emitting = true
		$MarginContainer/HBoxContainer/VBoxContainer.add_child(_goodReaction)
		GoodTimer.start()
		
	progressBar.value = Globals.interviewScore
	



func _on_star_timer_timeout():
	$MarginContainer/HBoxContainer/VBoxContainer/StarTurnOff.texture=ResourceLoader.load("res://sprites/scoreSymbols/star-turn-off.png")


func _on_sad_timer_timeout():
	$MarginContainer/HBoxContainer/VBoxContainer/SadTurnOff.texture = ResourceLoader.load("res://sprites/scoreSymbols/SadSmile2TurnOff.png")


	
	


func _on_pause_pressed():
	var GamePause = get_tree().get_root().get_node("Game/GamePause")
	GamePause.show()


func _on_good_timer_timeout():
	$MarginContainer/HBoxContainer/VBoxContainer/GoodTurnOff.texture = ResourceLoader.load("res://sprites/scoreSymbols/GoodSmile2TurnOff.png")
