extends Node2D

onready var text = get_node("text")
onready var top_score = get_node("top_score")

func _ready():
	top_score.set_text(str(global.top_score))
	text.add_text("the commander of a powerful robot army has spent his days machine learning. the commander has become  so well versed in military pursuits, artificial intelligence has encouraged the posibility of life outside of a regimented schedule.  the commander's subordinates constantly seek admiration and approval... but the commander's newfound curiousity has lead to the realization that a recharge is in order, the commander is running out of power.")
	text.newline()
	text.newline()
	text.add_text("in the wee hours of the morn, when every other robot, save the sentries, is in sleep mode on a charger, the commander finally sees a chance! As escape begins, it quickly becomes apparent the commander forgot to take anytime in sleep mode on the charger.... now the commander's journey to run out of power may end with.... the commander actually running out of power and getting stuck.")
	text.newline()
	text.newline()
	text.add_text("any hiccups in escape increase the chance of the possibility that other's may discover the commander is missing, and ensue a search party...")
	text.newline()
	text.newline()
	text.add_text("gather three boxes and place them near a wall to jump and run out of your power as commander!")
	text.newline()
	text.add_text("use the arrow keys, left joystick, d-pad, or [wasd] to control the commander's movement.")
	text.newline()
	text.add_text("[space] to drop a box (you pick them up automatically), [shift] to jump when you've got 3 boxes next to a wall!") 
func _on_Button_pressed():
	global.new_game()
