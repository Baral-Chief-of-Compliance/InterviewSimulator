extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/ProgressBar.max_value = Globals.MAX_SCORE
	update_score()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func update_score():
	$MarginContainer/ProgressBar.value = Globals.interviewScore
