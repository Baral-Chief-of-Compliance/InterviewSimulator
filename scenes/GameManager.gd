extends Node


class_name GameManager
@onready var director = $"../VBoxContainer/Director"
@onready var TimerForReaction = $"../TimerForReaction"

func change_reaction(reaction):
	
	match reaction:
		"smile":
			TimerForReaction.stop()
			$"../VBoxContainer/Director/sad".hide()
			$"../VBoxContainer/Director/delighted".hide()
			$"../VBoxContainer/Director/normal".hide()
			$"../VBoxContainer/Director/shocked".hide()
			$"../VBoxContainer/Director/smile".show()
			TimerForReaction.start()
			
		"sad":
			TimerForReaction.stop()
			$"../VBoxContainer/Director/smile".hide()
			$"../VBoxContainer/Director/delighted".hide()
			$"../VBoxContainer/Director/normal".hide()
			$"../VBoxContainer/Director/shocked".hide()
			$"../VBoxContainer/Director/sad".show()
			TimerForReaction.start()
			
		"delighted":
			TimerForReaction.stop()
			$"../VBoxContainer/Director/smile".hide()
			$"../VBoxContainer/Director/sad".hide()
			$"../VBoxContainer/Director/normal".hide()
			$"../VBoxContainer/Director/shocked".hide()
			$"../VBoxContainer/Director/delighted".show()
			TimerForReaction.start()
			
		"normal":
			TimerForReaction.stop()
			$"../VBoxContainer/Director/smile".hide()
			$"../VBoxContainer/Director/sad".hide()
			$"../VBoxContainer/Director/delighted".hide()
			$"../VBoxContainer/Director/shocked".hide()
			$"../VBoxContainer/Director/normal".show()
			TimerForReaction.start()
			
		"shocked":
			TimerForReaction.stop()
			$"../VBoxContainer/Director/smile".hide()
			$"../VBoxContainer/Director/sad".hide()
			$"../VBoxContainer/Director/delighted".hide()
			$"../VBoxContainer/Director/normal".hide()
			$"../VBoxContainer/Director/shocked".show()
			TimerForReaction.start()
			


func _on_timer_for_reaction_timeout():
	$"../VBoxContainer/Director/sad".hide()
	$"../VBoxContainer/Director/delighted".hide()
	$"../VBoxContainer/Director/shocked".hide()
	$"../VBoxContainer/Director/normal".hide()
	$"../VBoxContainer/Director/smile".show()
