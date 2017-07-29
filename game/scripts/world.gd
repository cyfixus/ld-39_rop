extends Node2D

onready var recharge = get_node("recharge")
func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	pass


func _on_hq_body_enter( body ):
	if body.get_groups().has("commander"):
		recharge.start()


func _on_recharge_timeout():
	global.change_power(10)


func _on_hq_body_exit( body ):
	if body.get_groups().has("commander"):
		recharge.stop()
