extends Button


var buttonLabel = ""
var emotionalColor = ""
var score = 0

func _ready():
	text = buttonLabel
	
func _on_pressed():
	var GameManager = get_tree().get_root().get_node("Game/GameManager")
	GameManager.change_reaction(emotionalColor)
