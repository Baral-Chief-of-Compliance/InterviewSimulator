extends MarginContainer


@onready var label = $MarginContainer/Label

#var MAX = get_viewport().size[0]
var MAX_WIDTH = 900

@export var dialogText = ""

var text = ""
var letter_index = 0

var letter_time = 0.03
var space_time = 0.06
var punctuation_time = 0.2

signal finished_displaying()

func display_text(text_to_display: String):
	text = text_to_display
	label.text = text_to_display
	
	await resized
	custom_minimum_size.x = min(size.x, MAX_WIDTH)
	
	if size.x > MAX_WIDTH:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized #wait for x resize
		await resized #wait for y resize
		custom_minimum_size.y = size.y
		
	#global_position.x -= size.x / 2
	#global_position.y -= size.y + 24
	
	label.text = text
