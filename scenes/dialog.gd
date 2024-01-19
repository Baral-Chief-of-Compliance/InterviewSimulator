extends Control


@onready var dialog_box = preload("res://scenes/dialog_box.tscn")


var current_question_index = 0
var current_question = {}

var dialog = [
	{
		"question": "Здравствуйте! Меня зовут Александра и директор этой компании. И буду вас собеседовать."
	},
	{
		"question": "Чем вас привлекла наша вакансия",
		"answers": [
			{
				"text": "Не знаю",
				"score": -1,
				"reaction" : "schock"
			},
			{
				"text": "Потому что",
				"score": -1,
				"reaction" : "schock"
			},
			
			{
				"text": "Как то так",
				"score": -1,
				"reaction" : "schock"
			},
			
			{
				"text": "че то да",
				"score": -1,
				"reaction" : "schock"
			},
		]
	}
]

func show_question():
	current_question = dialog[current_question_index]
	var dialog_box_instantiate = dialog_box.instantiate()
	dialog_box_instantiate.dialogText = current_question["question"]
	$VBoxContainer/question.add_child(dialog_box_instantiate)
	dialog_box_instantiate.display_text(current_question["question"])
	$VBoxContainer/Button.show()
	
func show_answers():
	var answers = dialog[current_question_index]["answers"]
	
	for a in answers:
		var dialog_box_instantiate = dialog_box.instantiate()
		dialog_box_instantiate.dialogText = a["text"]
		$VBoxContainer/answeres.add_child(dialog_box_instantiate)
		dialog_box_instantiate.display_text(a["text"])
	

# Called when the node enters the scene tree for the first time.
func _ready():
	show_question()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func clean_question():
	var children = $VBoxContainer/question.get_children()
	for c in children:
		c.queue_free()
		

func clean_answers():
	var children = $VBoxContainer/answeres.get_children()
	for c in children:
		c.queue_free()


func _on_button_pressed():
	clean_question()
	clean_answers()
	
	current_question_index =+ 1
	show_question()
	show_answers()
