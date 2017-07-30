extends Area2D

onready var light = get_parent()

func _ready():
	add_to_group("wanderer")
	

func _on_fov_body_enter( body ):
	if body.get_groups().has("commander"):
		light.set_color("ff0000")
