extends KinematicBody2D

onready var sprite = get_node("sprite")
onready var collision = get_node("collision")
onready var ray = get_node("ray")
onready var anim = get_node("anim")
var disabled = false
export var MOTION_SPEED = 140

func _ready():
	add_to_group("commander")
	set_process(true)
	set_process_input(true)
	global.connect("win", self, "wall_jump")
	global.connect("game_over", self, "game_over")
	
func _input(event):
	pass

func game_over(state):
	disabled = true
	if state == 0:
		anim.play("spin_out")
	if state == 1:
		anim.play("rop")
	
func wall_jump(dir):
	collision.set_trigger(true)
	anim.play("jump")
	set_pos(get_global_pos()+dir)
	collision.set_trigger(false)

func rotate(deg):
	ray.set_rotd(deg)
	sprite.set_rotd(deg)
	
func _process(delta):
	if !disabled:
		var motion = Vector2()
	
		if Input.is_action_pressed("ui_down"):
			motion += Vector2(0, 1)
			rotate(0)

		if Input.is_action_pressed("ui_up"):
			motion += Vector2(0, -1)
			rotate(180)
		
		if Input.is_action_pressed("ui_left"):
			motion += Vector2(-1, 0)
			rotate(-90)
				
		if Input.is_action_pressed("ui_right"):
			motion += Vector2(1, 0)
			rotate(90)
		

		
		if (Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_right")) || Input.is_action_pressed("ur"):
			motion += Vector2(1, -1)
			rotate(135)

		
		if (Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_left")) || Input.is_action_pressed("ul"):
			motion += Vector2(-1, -1)
			rotate(-135)

		
		if (Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_right")) || Input.is_action_pressed("dr"):
			motion += Vector2(1, 1)
			rotate(45)

			
		if (Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_left")) || Input.is_action_pressed("dl"):
			motion += Vector2(-1, 1)
			rotate(-45)

		
		motion = motion.normalized()*MOTION_SPEED*delta
		move(motion)
		global.commander_pos = get_global_pos()
		if is_colliding():
			sfx.play("thud")