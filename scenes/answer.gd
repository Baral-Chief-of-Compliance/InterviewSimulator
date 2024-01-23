extends Button


var buttonLabel = ""
var emotionalColor = ""
var score = 0

func _ready():
	text = buttonLabel
	
func _on_pressed():
	Globals.interviewScore = Globals.interviewScore + score
	print(Globals.interviewScore)
	var ScoreBar = get_tree().get_root().get_node("Game/ScoreBar")
	ScoreBar.update_score()
	var GameManager = get_tree().get_root().get_node("Game/GameManager")
	GameManager.change_reaction(emotionalColor)
	
	var dialog = get_tree().get_root().get_node("Game/dialog")
	dialog._on_button_pressed()
	
	
