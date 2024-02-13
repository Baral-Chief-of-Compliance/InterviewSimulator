extends Button


var buttonLabel = ""
var emotionalColor = ""
var score = 0
var recomendation = ""

#HINTS
@onready var BackGroundHint = preload("res://scenes/hint_background.tscn")
@onready var ThanksForHint = preload("res://scenes/thanks_hint.tscn")
@onready var HintsStorage = preload("res://scenes/hints_storage.tscn")
@onready var HintText = preload("res://scenes/hint.tscn")

func _ready():
	$RichTextLabel.text = "[center] %s [/center]" % buttonLabel
	
func _on_pressed():
	
	if emotionalColor == Globals.SHOCKED or emotionalColor == Globals.SAD:
		
		var dialog = get_tree().get_root().get_node("Game/dialog")
		
		
		var hint_instantiate = HintText.instantiate()
		hint_instantiate.dialogText = recomendation
		
		var BackGroundHint_instantiate = BackGroundHint.instantiate()
		dialog.add_child(BackGroundHint_instantiate)
		
		var HintsStorage_instantiate = HintsStorage.instantiate()
		dialog.add_child(HintsStorage_instantiate)
		HintsStorage_instantiate.add_child(hint_instantiate)
	
		var ThanksForHint_instantiate = ThanksForHint.instantiate()
	
		hint_instantiate.display_text(recomendation)
		HintsStorage_instantiate.add_child(ThanksForHint_instantiate)
		
		
	Globals.interviewScore = Globals.interviewScore + score
	var ScoreBar = get_tree().get_root().get_node("Game/ScoreBar")
	ScoreBar.update_score(emotionalColor)
	var GameManager = get_tree().get_root().get_node("Game/GameManager")
	GameManager.change_reaction(emotionalColor)
	
	var dialog = get_tree().get_root().get_node("Game/dialog")
	dialog._on_button_pressed()
	
	
func show_color():
	print(emotionalColor)
	match emotionalColor:
		Globals.SHOCKED:
			$SAD.play("SAD")
			print("sad")
		Globals.SAD:
			$SAD.play("SAD")
			print("sad")
		Globals.SMILE:
			$Smile.play("SMILE")
			print("smile")
		Globals.DELIGHTED:
			$DELIGHTED.play("DELIGHTED")
			print("DELIGHTED")
	print("\n\n")
