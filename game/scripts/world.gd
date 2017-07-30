extends Node2D

onready var recharge = get_node("recharge")
onready var enemy_spawn = get_node("enemy_spawn")
onready var score = get_node("hud/score")
onready var game_timer = get_node("game_timer")
onready var time = get_node("hud/time")

var wanderer = preload("res://game/scenes/wanderer.tscn")
var tent = preload("res://game/scenes/tent.tscn")
var box = preload("res://game/scenes/box.tscn")
var battery = preload("res://game/scenes/battery.tscn")
var game_over = preload("res://game/scenes/game_over.tscn")
var win = preload("res://game/scenes/win.tscn")


var orientations = [0, 90]
var tent_positions = []



func pitch_tents():
	for i in range(0, 16):
		var new_tent = tent.instance()
		var tent_pos = Vector2(rand_range(80, 600), rand_range(120, 290))
		tent_positions.append(tent_pos)
		new_tent.set_global_pos(tent_pos)
		new_tent.get_node("tent").set_rotd(orientations[randi()%orientations.size()])
		add_child(new_tent)
		
func lay_boxes():
	for i in range(0, 3):
		var new_box = box.instance()
		new_box.set_global_pos(Vector2(rand_range(80, 640), rand_range(80, 340)))
		if new_box.is_colliding():
			if new_box.get_collider().get_groups().has("tent"):
				i -= 1
		else:
			add_child(new_box)
		
func disperse_batteries():
	for i in range(0, 12):
		var new_battery = battery.instance()
		new_battery.set_global_pos(Vector2(rand_range(80, 640), rand_range(80, 340)))
		add_child(new_battery)
		
func game_over(state):
	if !global.go && !global.win:
		global.time_left = game_timer.get_time_left()
		add_child(game_over.instance())
	
func win():
	if !global.go && !global.win:
		add_child(win.instance())
		
func _ready():
	
	randomize()
	pitch_tents()
	lay_boxes()
	disperse_batteries()
	set_fixed_process(true)
	global.connect("game_over", self, "game_over")
	global.connect("win", self, "win")
	global.connect("power_changed", self, "score")
	
func score(power):
	score.set_text(str(global.score))
	
func _fixed_process(delta):
	time.set_text(str(game_timer.get_time_left()))
	pass


func _on_hq_body_enter( body ):
	if body.get_groups().has("commander"):
		recharge.start()
		

func _on_recharge_timeout():
	global.change_power(20)
	sfx.play("recharge")


func _on_hq_body_exit( body ):
	if body.get_groups().has("commander"):
		recharge.stop()


func _on_enemy_spawn_timeout():
	if global.wanderer_count < 25:
		var new_wanderer = wanderer.instance()
		var tent_pos = tent_positions[randi()%tent_positions.size()]
		new_wanderer.set_global_pos(tent_pos)
		add_child(new_wanderer)
		global.wanderer_count += 1
		global.multiplier += 0.5
	if enemy_spawn.get_wait_time() < 2:
		enemy_spawn.set_wait_time(5)
	else: 
		enemy_spawn.set_wait_time(enemy_spawn.get_wait_time() - 1)
	


func _on_game_timer_timeout():
	global.state = 3
	global.emit_signal("game_over", 3)


func _on_reset_pressed():
	global.new_game()
