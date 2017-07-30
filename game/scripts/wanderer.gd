extends KinematicBody2D

onready var sprite = get_node("sprite")
onready var move_timer = get_node("move_timer")
var MOTION_SPEED = 100

var dirs = [Vector2(0,0), Vector2(1,0), Vector2(1,1), Vector2(0,1), Vector2(-1,0), Vector2(-1,-1), Vector2(0,-1), Vector2(1, -1), Vector2(-1, 1)]
var dir = Vector2()
func _ready():
	add_to_group("wanderer")
	set_fixed_process(true)
	
func _fixed_process(delta):
	dir = dir.normalized()*MOTION_SPEED*delta
	move(dir)

func rotate(deg):
	sprite.set_rotd(deg)

func _on_move_timer_timeout():
	dir = dirs[randi() % dirs.size()]
	if dir == dirs[3]: #down
		rotate(0)
	if dir == dirs[1]:
		rotate(90)
	if dir == dirs[2]:
		rotate(45)
	if dir == dirs[4]:
		rotate(-90)
	if dir == dirs[5]:
		rotate(-135)
	if dir == dirs[6] || dir == dirs[0]:
		rotate(180)
	if dir == dirs[7]:
		rotate(135)
	if dir == dirs[8]:
		rotate(-45)
