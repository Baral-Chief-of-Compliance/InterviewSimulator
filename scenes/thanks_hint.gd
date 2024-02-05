extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var Background = get_tree().get_root().get_node("Game/dialog/HintBackground")
	Background.queue_free()
	var HintStorage = get_tree().get_root().get_node("Game/dialog/HintsStorage")
	HintStorage.queue_free()
