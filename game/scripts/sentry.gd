extends Area2D

onready var light = get_parent()

func _ready():
	add_to_group("sentry")

func _on_sentry_body_enter( body ):
	if body.get_groups().has("commander"):
		light.set_color("ff0000")