extends Control


@onready var dialog_box = preload("res://scenes/dialog_box.tscn")
@onready var answer = preload("res://scenes/answer.tscn")
@onready var marginBetweenAnswers = preload("res://scenes/margin_between_answers.tscn")


var current_question_index = 0
var current_question = {}

var dialog = [
	{
		"question": "Здравствуйте! Меня зовут Александра и директор этой компании. И буду вас собеседовать.",
		"answers" : []
	},
	{
		"question": "Чем вас привлекла наша вакансия",
		"answers": [
			{
				"text": "Не знаю",
				"score": 5,
				"emotionalColor" : "smile"
			},
			{
				"text": "Потому что",
				"score": 10,
				"emotionalColor" : "sad"
			},
			
			{
				"text": "Как то так",
				"score": 15,
				"emotionalColor" : "delighted"
			},
			
			{
				"text": "че то да",
				"score": 20,
				"emotionalColor" : "normal"
			},
		]
	},
	{
		"question": "Это будет второй вопрос",
		"answers": [
			{
				"text": "1",
				"score": 25,
				"emotionalColor" : "shocked"
			},
			{
				"text": "2",
				"score": 30,
				"emotionalColor" : "smile"
			},
			
			{
				"text": "3",
				"score": 35,
				"emotionalColor" : "sad"
			},
			
			{
				"text": "4",
				"score": 40,
				"emotionalColor" : "delighted"
			},
		]
	}
]

func show_question():
	if (current_question_index + 1) > len(dialog):
		var ApairPhone = get_tree().get_root().get_node("Game/ApiarPhone")
		ApairPhone.play("apairPhone")
		#await get_tree().change_scene_to_file("res://scenes/game_menu.tscn")
	else:
		current_question = dialog[current_question_index]
		var dialog_box_instantiate = dialog_box.instantiate()
		dialog_box_instantiate.dialogText = current_question["question"]
		$VBoxContainer/question.add_child(dialog_box_instantiate)
		dialog_box_instantiate.display_text(current_question["question"])
		
		#добавить расстояние между вопросом и ответами
		var marginBetweenAnswersInstantiate = marginBetweenAnswers.instantiate()
		$VBoxContainer/answeres.add_child(marginBetweenAnswersInstantiate)
		
		if current_question["answers"] == []:
			$VBoxContainer/Button.show()
		else:
			$VBoxContainer/Button.hide()
	
func show_answers():
	if (current_question_index + 1) > len(dialog):
		pass
	else:
		var answers = dialog[current_question_index]["answers"]
		
		for a in answers:
			var answer_instantiate = answer.instantiate()
			answer_instantiate.buttonLabel = a["text"]
			answer_instantiate.score = a["score"]
			answer_instantiate.emotionalColor = a["emotionalColor"]
			$VBoxContainer/answeres.add_child(answer_instantiate)
			
			#добавляем расстояние между ответами
			var marginBetweenAnswersInstantiate = marginBetweenAnswers.instantiate()
			$VBoxContainer/answeres.add_child(marginBetweenAnswersInstantiate)
			#answer_instantiate.display_text(a["text"])
	

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
	
	current_question_index = current_question_index + 1
	print(current_question_index)
	show_question()
	await show_answers()
