extends Area2D
func _ready():
	add_to_group("battery")
	
func _on_battery_body_enter( body ):
	if body.get_groups().has("commander"):
		global.change_power(10)
		queue_free()
		
