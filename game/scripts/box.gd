extends RigidBody2D

var picked_up = false
onready var collision = get_node("collision")

func _ready():
	add_to_group("box")
	set_fixed_process(true)
	pass


func _fixed_process(delta):
	if Input.is_action_pressed("drop"):
		picked_up = false
	if picked_up:
		set_global_pos(Vector2((global.commander_pos.x + 4), (global.commander_pos.y + 4)))

func _on_grab_area_body_enter( body ):
	if body.get_groups().has("commander"):
		picked_up = true
