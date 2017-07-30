extends Node2D

onready var score = get_node("panel/score")
onready var top_score = get_node("panel/top_score")

func _ready():
	global.win = true
	var total_score = int((global.time_left + global.score) * global.multiplier)
	if total_score > global.top_score:
		global.top_score = total_score
		persistence.save_data()
	score.set_text(str(total_score))
	top_score.set_text(str(global.top_score))
	set_process_input(true)
	pass

func _on_Button_pressed():
	global.new_game()


func _on_menu_pressed():
	global.menu()
