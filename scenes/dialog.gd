extends Control


@onready var dialog_box = preload("res://scenes/dialog_box.tscn")
@onready var answer = preload("res://scenes/answer.tscn")
@onready var marginBetweenAnswers = preload("res://scenes/margin_between_answers.tscn")
@onready var HintText = preload("res://scenes/hint.tscn")


@onready var raw1Answers = $VBoxContainer/answeres/raw1
@onready var raw2Answers = $VBoxContainer/answeres/raw2

@onready var answereRaws = [raw1Answers, raw2Answers]


@onready var QuestionPoint = $VBoxContainer2/DialogSpawner

@onready var HintButton = $HBoxContainer/HintButton/HintButton


#Hints - Советы
@onready var HintPosition = $HintPosition
@onready var BackGroundHint = preload("res://scenes/hint_background.tscn")
@onready var ThanksForHint = preload("res://scenes/thanks_hint.tscn")
@onready var HintsStorage = preload("res://scenes/hints_storage.tscn")


var current_question_index = 0
var current_question = {}

var dialog = [
	#ВСТУПЛЕНИЕ
	{	
		"question": "Здравствуйте! Меня зовут Александра и директор этой компании. И буду вас собеседовать.",
		"answers" : []
	},
	#1-ый вопрос
	{
		"question": "Что Вы можете рассказать о себе?",
		"recomendation": "В рассказе о себе лучше использовать информацию, связанную с профессиональной деятельностью, чем личные данные. Работодатель хочет в первую очередь услышать о вас, как о специалисте, о том, как складывалась ваша карьерная траектория, о ваших удачах и профессиональных достижениях.",
		"answers": [
			{
				"text": "Перескажу основные пункты из резюме",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Расскажу о прошлой работе и пройденном обучении",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
		
			{
				"text": "Расскажу о своих профессиональных умениях и навыках",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			
			{
				"text": "Мне нечего о себе рассказать. Нужно быть скромнее",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
		]
	},
	#2-ой вопрос
	{
		"question": "Почему Вы уволились с предыдущего места работы?",
		"recomendation": "Причины, по которым вы ищете новую работу, могут быть разными, но не стоит забывать, что важно оставаться в хороших отношениях, даже если вы ушли из-за разногласий. Не стоит говорить плохо о бывших коллегах и, конечно же, о том, что вы не справлялись с работой или совмещением.",
		"answers": [
			{
				"text": "Решил сменить сферу деятельности",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
			{
				"text": "Не смог найти общий язык с руководством и коллегами",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			
			{
				"text": "Работа была слишком нервная, а требования невыполнимыми",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			
			{
				"text": "Хочу развиваться в своей профессии, поэтому ищу место, где мои знания и опыт принесут большую пользу",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
		]
	},
	#3-ий вопрос
	{
		"question": "Почему Вы много раз меняли работу?",
		"recomendation": "Важно подчеркнуть, что частая смена работы была вызвана не легкомысленностью или конфликтностью, чтобы у работодателя не сложилось мнение, что Вы также сможете быстро уйти из-за малейших трудностей.",
		"answers": [
			{
				"text": "Мне стало скучно",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "У меня были проблемы со своими коллегами на предыдущей работе",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Функционал или зарплатные ожидания, согласованные при трудоустройстве, по итогу не соответствовали действительности",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			{
				"text": "Работодатели грубо нарушали условия трудового договора",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
			
		]
	},
	#4-ый вопрос
	{
		"question": "Каковы Ваши слабые стороны?",
		"recomendation": "У каждого человека есть недостатки, поэтому не стоит говорить, что у Вас нет слабых сторон. Подумайте, какие отрицательные качества присущи вам. Главное здесь – упомянуть реальную слабость, но не то, что может помешать вам выполнять свою работу. Также полезно упомянуть, как вы работаете над преодолением этой слабости и пониманием того, как она негативно влияет на вас.",
		"answers": [
			{
				"text": "У меня нет слабых сторон",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Я недостаточно владею некоторыми навыками, но я быстро учусь и готов развиваться в своей профессии",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			{
				"text": "Я часто проявляю инициативу, беру на себя ответственность за выполнение общих задач, из-за этого устаю",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
			{
				"text": "Часто опаздываю, иногда забываю о поручениях",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
		]
	},
	#5-ый вопрос
	{
		"question": "Почему Вы хотите работать у нас?",
		"recomendation": "Работодатель безусловно желает знать, что Вы здесь не случайно. Нужно убедить его в том, что Вы искренне заинтересованы работать именно в его компании.  Для подготовки к этому вопросу необходимо заранее изучить информацию о компании",
		"answers": [
			{
				"text": "Меня устраивает зарплата и ваш офис находится близко к моему дому",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Вы первые, кто наконец-то пригласил меня на собеседование",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Давно хотел попасть в вашу организацию, я уверен, что смогу здесь реализоваться и принести вам пользу",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},		
			{
				"text": "Меня заинтересовали ценности и репутация вашей компании",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},	
		]
	},
	#6-ой вопрос
	{
		"question": "Как Вы узнали об этой вакансии?",
		"recomendation": "Хотя на первый взгляд это может показаться простым вопросом, вы должны использовать любую возможность, чтобы продемонстрировать свой интерес к компании. Даже если вы не обновляли постоянно сайт компании для поиска вакансий, сделайте так, чтобы это выглядело так. Расскажите, что вас волнует в этой вакансии или что именно привлекло ваше внимание.",
		"answers": [
			{
				"text": "Совершенно случайно, вот решил сходить к вам",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Я целенаправленно искал такую работу и поэтому я здесь",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},	
			{
				"text": "Ждал давно, когда появится вакансия в вашей организации",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},	
			{
				"text": "Это было не мое решение, в центре занятости выдали направление",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
		]
	},
	#7-ой вопрос
	{
		"question": "Рассматриваете ли вы варианты работы в других компаниях?",
		"recomendation": "Если Вы скажете, что не рассматриваете другие организации, может показаться, что у вас нет других вариантов для трудоустройства и вы не конкурентоспособны. Важно отметить поиск конкретной профессии – это укажет будущему работодателю, что Вы целеустремленный человек и знаете что ищете.",
		"answers": [
			{
				"text": "Нет, рассматриваю только Вашу организацию",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Рассматриваю другие варианты работы, но предпочтительнее Ваша организация",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},	
			{
				"text": "Постоянно посещаю разные собеседования на разные должности",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Пока нет – я не особо активно искал работу, пока мой друг не порекомендовал вашу компанию",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},	
		]
	},
	#8-ой вопрос
	{
		"question": "Что Вы знаете о нашей организации?",
		"recomendation": "Работодатель, безусловно, хочет видеть, что Вы здесь неслучайно. Эмпирическое правило заключается в том, чтобы перед собеседованием нужно навести справку об организации, в которую Вы идете трудоустраиваться.",
		"answers": [
			{
				"text": "Я ничего не знаю. Может, Вы мне расскажите?",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},	
			{
				"text": "Я узнал о вас из вакансии на портале «Работа России», провел небольшое исследование и понял, что именно здесь я смогу реализовать себя как профессионал",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			{
				"text": "Я знаю, что вы одна из крупных компаний в сфере Х в нашем регионе. Информация о вас часто появляется в новостях. Я читал, что вы …",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			{
				"text": "У меня здесь друг работает, он говорит, что здесь хорошо платят",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},							
		]
	},
	#9-ый вопрос
	{
		"question": "Что мы можем от Вас ожидать в первые месяцы работы?",
		"recomendation": "Грамотный специалист быстро осваивается на новом месте работы, составляет план и приступает к выполнению задач, умеет разглядеть перспективы роста, ставит перед собой конкретные цели, а не строит «замки из песка»",
		"answers": [
			{
				"text": "Я изучу цели, задачи и планы, познакомлюсь с коллегами",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
			{
				"text": "Буду адаптироваться на новом рабочем месте",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Приведу к головокружительному успеху вашу организацию",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},	
			{
				"text": "Поставлю задачи, которые буду планомерно выполнять, и намечу приоритетные цели",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},		
		]
	},
	
	#10-ый вопрос
	{
		"question": "Почему мы должны взять именно Вас?",
		"recomendation": "При ответе на данный вопрос категорически нельзя говорить что-то негативное о компании или принижать других кандидатов. Причины должны быть конструктивными и логически обоснованными.",
		"answers": [
			{
				"text": "Я гораздо умнее, чем все мои коллеги",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "У меня есть опыт работы, что позволит мне справиться с обязанностями на новом месте",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
			{
				"text": "На прошлых местах работы я добился конкретных результатов и могу такую же пользу принести и вам",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},	
			{
				"text": "Вы неправильно работаете, я смогу сделать все как надо",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
		]
	},
	#11-ый вопрос
	{
		"question": "Какую зарплату Вы хотите получать?",
		"recomendation": "Важно не просто назвать размер желаемой зарплаты, но и обосновать его. А для этого необходимо изучить рынок труда, оценить свои способности, узнать, сколько платят людям на аналогичной позиции в вашем городе/регионе",
		"answers": [
			{
				"text": "Чем больше, тем лучше, я недавно взял ипотеку/кредит",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Я уже согласен на любую зарплату, надоело ходить по собеседованиям",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Среднюю зарплату на аналогичной должности в моем городе",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
			{
				"text": "На прошлой работе я получал … рублей, но теперь хочу больше зарабатывать, исходя из нового приобретенного опыта и знаний",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},	
		]
	},
	
	#12-ый вопрос
	{
		"question": "Кем Вы видите себя через 5 лет в нашей компании?",
		"recomendation": "При ответе нужно быть как можно более конкретным, без расплывчатых формулировок, но не быть непоколебимым. Для руководителя важно знать, что вы будете стремиться работать в интересах компании и развивать сам. Нельзя говорить, что в долгосрочной",
		"answers": [
			{
				"text": "Надеюсь, что буду работать на той же должности",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Сам стану руководителем, буду сидеть в Вашем кресле!",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Планирую обучаться, развивать свой потенциал и вносить свой вклад в общее дело",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			{
				"text": "Надеюсь на карьерный рост и высокую зарплату",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
		]
	},
	#13-ый вопрос
	{
		"question": "Какое ваше самое большое достижение?",
		"recomendation": "Задавая этот вопрос работодатель желает узнать о ваших профессиональных достижениях. Они должны иметь прямое отношение к должности, на которую Вы претендуете. При ответе оперируйте фактами и цифрами, вносите больше конкретики.",
		"answers": [
			{
				"text": "Путешествия по миру",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Повышение квалификации по профессии и рост по карьерной лестнице",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			{
				"text": "Не знаю. У меня нет особых достижений",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Я хорошо выполнял обязанности на предыдущей работе",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			}
		]
	},
	
	#14-вопрос
	{
		"question": "Как Вы оцениваете Ваше прошлое место работы?",
		"recomendation": "Любой нелестный комментарий может сыграть против Вас. Но и чрезмерно «сладко» рассказывать тоже нежелательно. Ищите золотую середину. Просто отметьте, что атмосфера была дружелюбной. Если захотите рассказать подробнее, отметьте пару приятных вещей",
		"answers": [
			{
				"text": "Конфликтный коллектив и несправедливое начальство",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Идеальное место работы, работал бы без выходных",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Начальник давал адекватную обратную связь сотрудникам",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
			{
				"text": "Задачи всегда грамотно распределялись, а в коллективе все старались поддерживать друг друга",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
		]
		
	},
	
	#15-вопрос
	{
		"question": "Какие сложные задачи встречались Вам в работе?",
		"recomendation": "В данном случае работодатель проверяет Вас на умение работать в нестандартных условиях или в сжатые сроки. Подбирая подходящий пример, обращайте внимание на то, чтобы он демонстрировал ваши положительные качества, которые пригодятся на новом месте работы",
		"answers":[
			{
				"text": "Все задачи были простыми, нестандартных и сложных задач не было",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Редко получалось выполнять сложные задачи",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Быстро реагирую при смене задач, всегда могу найти креативное решение",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			{
				"text": "Всегда беру ответственность на себя при выполнении срочных и сложных задач",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
		]
	},
	
	#16-вопрос
	{
		"question": "Уделяете ли Вы время дополнительному образованию?",
		"recomendation": "Хороший специалист никогда не перестает обучаться. Подумайте над тем, какими способами Вы поддерживаете свои навыки на должном уровне",
		"answers":[
			{
				"text": "Да, я люблю учиться новому, стараюсь отслеживать современные тенденции и применять их в своей работе",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			{
				"text": "Нет, у меня нет на это времени, к тому же у меня уже есть образование",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Да, если организация оплачивает мне обучение",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
			{
				"text": "Это ни к чему, я и так все умею",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
		]
	},
	
	#17-вопрос
	{
		"question": "Как Вы планируете свое рабочее время?",
		"recomendation": "Грамотный специалист не ждет планерок, он умеет структурировать свое время, планировать, расставлять задачи в приоритетном порядке и самостоятельно принимать решения",
		"answers": [
			{
				"text": "Начинаю день с чашечки кофе, чтобы настроиться на работу",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Составляю план, выделяю срочные и приоритетные задачи и приступаю к их выполнению",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			{
				"text": "Жду планерки, когда нам поступят задачи от руководителя",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Решаю задачи по мере их поступления, не планирую, а сразу делаю",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
		]
	},
	
	#18-вопрос
	{
		"question": "Как Вы относитесь к сверхурочной работе?",
		"recomendation": "Тут все сильно зависит от Вашей реальной ситуации. Ведь будет неловко, если Вы скажете, что готовы перерабатывать, а потом не сможете этого делать. Но и говоря, что переработки Вам не по душе, Вы показываете свое равнодушие к потенциальным проблемам компании. Потому рекомендуем найти золотую середину.",
		"answers": [
			{
				"text": "Я готов задерживаться и понимаю, что иногда это необходимо. Но хотел бы уточнить, как часто возникает такая необходимость?",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			{
				"text": "Нет, для меня это неприемлемо",
				"score": Globals.DELIGHTED_SCORE,
				"emotionalColor" : Globals.DELIGHTED
			},
			{
				"text": "Да, готов, если за это будет дополнительная оплата",
				"score": Globals.NORMAl_SCORE,
				"emotionalColor" : Globals.NORMAL
			},
			{
				"text": "Категорически нет! Зачем вы людей обманываете, когда пишете в вакансии про 8часовой рабочий день?",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
		]
	},
	
	#19-вопрос
	{
		"question": "Какое Ваше хобби?",
		"recomendation": "Озвучивать стоит только то, что приближает вас к получению должности.Будет дополнительным плюсом, если Ваше хобби совпадает с ценностями компании. Поэтому нужно заранее попытаться собрать о компании максимум информации, чтобы должным образом подготовиться.",
		"answers": [
			{
				"text": "Ничем не увлекаюсь, в свободное время смотрю телевизор",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Играю в компьютерные игры, могу всю ночь играть",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Занимаюсь творчеством",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			{
				"text": "Занимаюсь спортом",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
		]
		
	},
	
	#20-вопрос
	{
		"question": "У вас есть к нам вопросы?",
		"recomendation": "Покажите, что вы действительно заинтересованы в этой работе, и вы действительно хотите больше узнать обо всех тонкостях этого места. Не стоит сразу переходить к вопросам о соцпакете и зарплате, чтобы не сложилось впечатление, что Вы пришли исключительно за ними.",
		"answers": [
			{
				"text": "У меня нет вопросов",
				"score": Globals.SAD_SCORE,
				"emotionalColor" : Globals.SAD
			},
			{
				"text": "Какой соцпакет предоставляете?",
				"score": Globals.SHOCKED_SCORE,
				"emotionalColor" : Globals.SHOCKED
			},
			{
				"text": "Какими наиболее важными навыками и качествами необходимо обладать, чтобы добиться успеха на этой должности",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
			{
				"text": "Расскажите подробнее об обязанностях на этой должности",
				"score": Globals.SMILE_SCORE,
				"emotionalColor" : Globals.SMILE
			},
		]
	},
	
	#Окончания собеседования
	{	
		"question": "Спасибо, что пришли на собеседование! О результатах вам мы сообщим позже",
		"answers" : []
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
		QuestionPoint.add_child(dialog_box_instantiate)
		dialog_box_instantiate.display_text(current_question["question"])
		
		#добавить расстояние между вопросом и ответами
		#var marginBetweenAnswersInstantiate = marginBetweenAnswers.instantiate()
		#$VBoxContainer/answeres.add_child(marginBetweenAnswersInstantiate)
		
		if current_question["answers"] == []:
			$VBoxContainer/Button.show()
		else:
			$VBoxContainer/Button.hide()
	
func show_answers():
	if (current_question_index + 1) > len(dialog):
		pass
	else:
		var answers = dialog[current_question_index]["answers"]
		
		var counter = 0
		for a in answers:
			var answer_instantiate = answer.instantiate()
			answer_instantiate.buttonLabel = a["text"]
			answer_instantiate.score = a["score"]
			answer_instantiate.emotionalColor = a["emotionalColor"]
			answer_instantiate.recomendation = dialog[current_question_index]["recomendation"]
			if counter < 2:
				answereRaws[0].add_child(answer_instantiate)
				if counter == 0:
					var marginBetweenAnswersInstantiate = marginBetweenAnswers.instantiate()
					answereRaws[0].add_child(marginBetweenAnswersInstantiate)
			else:
				answereRaws[1].add_child(answer_instantiate)
				if counter == 2:
					var marginBetweenAnswersInstantiate = marginBetweenAnswers.instantiate()
					answereRaws[1].add_child(marginBetweenAnswersInstantiate)

			#answereNodes[counter].add_child(answer_instantiate)
			counter = counter + 1
			#$VBoxContainer/answeres.add_child(answer_instantiate)
			
			
			
			#добавляем расстояние между ответами
			#var marginBetweenAnswersInstantiate = marginBetweenAnswers.instantiate()
			#$VBoxContainer/answeres.add_child(marginBetweenAnswersInstantiate)
			#answer_instantiate.display_text(a["text"])
	
	
func get_current_recomendation():
	var recomendation = dialog[current_question_index]["recomendation"]
	return recomendation
	
func chek_button_hint():
	if current_question_index + 1 > 0:
		HintButton.show()
	elif current_question_index + 1 > len(dialog):
		HintButton.hide()

# Called when the node enters the scene tree for the first time.
func _ready():
	show_question()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func clean_question():
	var children = QuestionPoint.get_children()
	for c in children:
		c.queue_free()
		

func clean_answers():
	#var children = $VBoxContainer/answeres.get_children()
	#for c in children:
	#	c.queue_free()
	
	for el in answereRaws:
		var children = el.get_children()
		for c in children:
			c.queue_free()


func _on_button_pressed():
	clean_question()
	clean_answers()
	chek_button_hint()
	
	current_question_index = current_question_index + 1
	show_question()
	await show_answers()


func _on_texture_button_pressed():
	var GamePause = get_tree().get_root().get_node("Game/GamePause")
	GamePause.show()


func _on_hint_button_pressed():
	var hint = get_current_recomendation()
	
	var hint_instantiate = HintText.instantiate()
	hint_instantiate.dialogText = hint
	
	var BackGroundHint_instantiate = BackGroundHint.instantiate()
	add_child(BackGroundHint_instantiate)
	
	
	var HintsStorage_instantiate = HintsStorage.instantiate()
	add_child(HintsStorage_instantiate)
	HintsStorage_instantiate.add_child(hint_instantiate)
	
	var ThanksForHint_instantiate = ThanksForHint.instantiate()
	
	hint_instantiate.display_text(hint)
	HintsStorage_instantiate.add_child(ThanksForHint_instantiate)




	
