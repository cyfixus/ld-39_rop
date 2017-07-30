extends Node2D

onready var recharge = get_node("recharge")
onready var enemy_spawn = get_node("enemy_spawn")
var wanderer = preload("res://game/scenes/wanderer.tscn")
var tent = preload("res://game/scenes/tent.tscn")
var box = preload("res://game/scenes/box.tscn")

var orientations = [0, 90]
var tent_positions = []

func pitch_tents():
	for i in range(0, 16):
		var new_tent = tent.instance()
		var tent_pos = Vector2(rand_range(80, 640), rand_range(80, 340))
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
		
func _ready():
	randomize()
	pitch_tents()
	lay_boxes()
	set_fixed_process(true)
	
func _fixed_process(delta):
	pass


func _on_hq_body_enter( body ):
	if body.get_groups().has("commander"):
		recharge.start()


func _on_recharge_timeout():
	global.change_power(20)


func _on_hq_body_exit( body ):
	if body.get_groups().has("commander"):
		recharge.stop()


func _on_enemy_spawn_timeout():
	var new_wanderer = wanderer.instance()
	var tent_pos = tent_positions[randi()%tent_positions.size()]
	new_wanderer.set_global_pos(tent_pos)
	add_child(new_wanderer)
	if enemy_spawn.get_wait_time() < 2:
		enemy_spawn.set_wait_time(5)
	else: 
		enemy_spawn.set_wait_time(enemy_spawn.get_wait_time() - 1)
	
