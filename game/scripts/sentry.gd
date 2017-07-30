extends Area2D

onready var light = get_parent()

func _ready():
	add_to_group("sentry")

func _on_sentry_body_enter( body ):
	if !global.go:
		if body.get_groups().has("commander"):
			light.set_color("ff0000")
			sfx.play("caught")
			global.state = 1
			global.emit_signal("game_over", 0)
		