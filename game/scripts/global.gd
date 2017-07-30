extends Node

var power = 50
var commander_pos = Vector2()
var wanderer_count = 0
var multiplier = 1
var score = 0
var go = false
var win = false
var win_state = false
var time_left = 100

var state = 0
var top_score = 0

var current_scene = null
var new_scene = null

var game = "res://game/scenes/world.tscn"
var menu = "res://game/scenes/menu.tscn"

signal power_changed
signal game_over
signal win
signal jumpable

func save():
	var data = { top_score=get_top_score() }
	return data
	
func _ready():
	add_to_group("persist")
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	
func change_power(change):
	power += change
	emit_signal("power_changed", power)
	if change > 0:
		score += change
	if !go:
		if power <= 0:
			power = 0
			state = 2
			sfx.play("rop")
			emit_signal("game_over", 1)
			go = true
		
	elif power > 300:
		power = 300
		
func goto_scene(path):
	var s = ResourceLoader.load(path)
	new_scene = s.instance()
	get_tree().get_root().add_child(new_scene)
	get_tree().set_current_scene(new_scene)
	current_scene.queue_free()
	current_scene = new_scene
	
func new_game():
	go = false
	win = false
	score = 0
	multiplier = 1
	wanderer_count = 0
	power = 50
	win_state = false
	state = 0
	goto_scene(game)
	
func menu():
	goto_scene(menu)
func get_top_score():
	return top_score