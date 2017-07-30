extends Node2D

onready var text = get_node("text")
onready var top_score = get_node("top_score")

func _ready():
	top_score.set_text(str(global.top_score))
	text.add_text("The commander of a powerful robot army has spent his days machine learning. The commander has become  so well versed in military pursuits, artificial intelligence has encouraged the posibility of life outside of a regimented schedule.  The commander's subordinates constantly seek admiration and approval... but the commander's newfound curiousity has lead to the realization that a recharge is in order, the commander is running out of power.")
	text.newline()
	text.newline()
	text.add_text("In the wee hours of the morn, when every other robot, save the sentries, is in sleep mode on a charger, the commander finally sees a chance! As escape begins, it quickly becomes apparent the commander forgot to take anytime in sleep mode on the charger.... now the commander's journey to run out of power may end with.... the commander actually running out of power and getting stuck.")
	text.newline()
	text.newline()
	text.add_text("Any hiccups in escape increase the chance of the possibility that other's may discover the commander is missing, and ensue a search party...")
	text.newline()
	text.newline()
	text.add_text("gather three boxes and place them near a wall to jump and run out of your power as commander!")
	text.newline()
	text.add_text("Use the arrow keys, left joystick, d-pad, or [WASD] to control the commander's movement.")
	text.newline()
	text.add_text("[SPACE] to drop a box (you pick them up automatically), [SHIFT] to jump when you've got 3 boxes next to a wall!") 
func _on_Button_pressed():
	global.new_game()
