extends Node


class_name GameManager
@onready var director = $"../VBoxContainer/Director"

func change_reaction(reaction):
	
	match reaction:
		"smile":
			$"../VBoxContainer/Director/sad".hide()
			$"../VBoxContainer/Director/delighted".hide()
			$"../VBoxContainer/Director/normal".hide()
			$"../VBoxContainer/Director/shocked".hide()
			$"../VBoxContainer/Director/smile".show()
			print("smile")
		"sad":
			$"../VBoxContainer/Director/smile".hide()
			$"../VBoxContainer/Director/delighted".hide()
			$"../VBoxContainer/Director/normal".hide()
			$"../VBoxContainer/Director/shocked".hide()
			$"../VBoxContainer/Director/sad".show()
			print("sad")
		"delighted":
			$"../VBoxContainer/Director/smile".hide()
			$"../VBoxContainer/Director/sad".hide()
			$"../VBoxContainer/Director/normal".hide()
			$"../VBoxContainer/Director/shocked".hide()
			$"../VBoxContainer/Director/delighted".show()
			print("delighted")
		"normal":
			$"../VBoxContainer/Director/smile".hide()
			$"../VBoxContainer/Director/sad".hide()
			$"../VBoxContainer/Director/delighted".hide()
			$"../VBoxContainer/Director/shocked".hide()
			$"../VBoxContainer/Director/normal".show()
			print("normal")
		"shocked":
			$"../VBoxContainer/Director/smile".hide()
			$"../VBoxContainer/Director/sad".hide()
			$"../VBoxContainer/Director/delighted".hide()
			$"../VBoxContainer/Director/normal".hide()
			$"../VBoxContainer/Director/shocked".show()
			print("shocked")
			
