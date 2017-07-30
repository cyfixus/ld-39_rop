extends Area2D
func _ready():
	hide()
	add_to_group("battery")
	add_to_group("shrouded")
	
func _on_battery_body_enter( body ):
	if body.get_groups().has("commander"):
		global.change_power(30)
		queue_free()
		
