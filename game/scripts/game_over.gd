extends Node2D

onready var score = get_node("panel/score")
onready var message = get_node("message")

func _ready():
	set_message()
	var total_score = int((global.time_left + global.score) * global.multiplier)
	score.set_text(str(total_score))
	global.go = true
	pass

func set_message():
	if !global.go:
		var text = ""
		if global.state == 1:
			text = "caught!"
		elif global.state == 2:
			text = "ran out of power!"
		elif global.state == 3:
			text = "no time, its morning!"
		message.set_text(str(text))
	
func _on_Button_pressed():
	global.new_game()


func _on_menu_pressed():
	global.menu()
