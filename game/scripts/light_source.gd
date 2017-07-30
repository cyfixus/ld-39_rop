extends Node2D

onready var light = get_node("light")
onready var power_loss = get_node("power_loss")
onready var light_area = get_node("light_area")

func _ready():
	power_loss.start()
	global.connect("power_changed", self, "adjust_light")
	global.connect("game_over", self, "game_over")
	
func adjust_light(power):
	var scale = power/20.0
	if scale <= 1:
		print("max")
	else:
		light.set_texture_scale(scale)
		light_area.set_scale(Vector2(scale, scale))
	print("scale", scale)
	
func game_over():
	print("game over")

func _on_power_loss_timeout():
	global.change_power(-1)
	power_loss.start()


func _on_Area2D_area_enter( area ):
	if area.get_groups().has("shrouded"):
		area.show()


func _on_Area2D_area_exit( area ):
	if area.get_groups().has("shrouded"):
		area.hide()
