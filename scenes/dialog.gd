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
				"text": "Но базовый вектор развития, а также свежий взгляд на привычные вещи — безусловно открывает новые горизонты для модели развития.",
				"score": 5,
				"emotionalColor" : "smile"
			},
			{
				"text": "С учётом сложившейся международной обстановки, сложившаяся структура организации является качественно новой ступенью глубокомысленных рассуждений.",
				"score": 10,
				"emotionalColor" : "sad"
			},
			
			{
				"text": "Повседневная практика показывает, что социально-экономическое развитие требует определения и уточнения первоочередных требований.",
				"score": 15,
				"emotionalColor" : "delighted"
			},
			
			{
				"text": "Внезапно, элементы политического процесса формируют глобальную экономическую сеть и при этом — описаны максимально подробно.",
				"score": 20,
				"emotionalColor" : "normal"
			},
		]
	},
	{
		"question": "В целом, конечно, выбранный нами инновационный путь обеспечивает актуальность экономической целесообразности принимаемых решений!",
		"answers": [
			{
				"text": "Следует отметить, что курс на социально-ориентированный национальный проект позволяет выполнить важные задания по разработке экономической целесообразности принимаемых решений!",
				"score": 25,
				"emotionalColor" : "shocked"
			},
			{
				"text": "Современные технологии достигли такого уровня, что граница обучения кадров представляет собой интересный эксперимент проверки кластеризации усилий.",
				"score": 30,
				"emotionalColor" : "smile"
			},
			
			{
				"text": "Следует отметить, что социально-экономическое развитие играет важную роль в формировании как самодостаточных, так и внешне зависимых концептуальных решений.",
				"score": 35,
				"emotionalColor" : "sad"
			},
			
			{
				"text": "Каждый из нас понимает очевидную вещь: высокотехнологичная концепция общественного уклада в значительной степени обусловливает важность благоприятных перспектив.",
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
		var EndTimer = get_tree().get_root().get_node("Game/EndGame")
		EndTimer.start()
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
