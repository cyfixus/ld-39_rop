extends Node2D

onready var north = get_node("north1")
onready var south = get_node("south1")
onready var east = get_node("east1")
onready var west = get_node("west1")

var n_box_count = 0
var s_box_count = 0
var e_box_count = 0
var w_box_count = 0
var n_passable = false
var s_passable = false
var e_passable = false
var w_passable = false
var commander_in = false

func _ready():
	set_process_input(true)
	pass

func _input(event):
	if event.is_action_pressed("jump"):
		if commander_in:
			if n_passable:
				global.emit_signal("win", Vector2(0, -32))
			elif s_passable:
				global.emit_signal("win", Vector2(0, 32))
			elif e_passable:
				global.emit_signal("win", Vector2(32, 0))
			elif w_passable:
				global.emit_signal("win", Vector2(-32, 0))
				
				
func _on_north1_body_enter( body ):
	if body.get_groups().has("box"):
		n_box_count += 1
		if n_box_count == 3:
			n_passable = true
			
	if body.get_groups().has("commander"):
		commander_in = true
			


func _on_north1_body_exit( body ):
	
	if body.get_groups().has("box"):
		n_box_count -= 1
		if n_box_count < 3:
			n_passable = false
			
	if body.get_groups().has("commander"):
		commander_in = false
			


func _on_south1_body_enter( body ):
	if body.get_groups().has("box"):
		s_box_count += 1
		if s_box_count == 3:
			s_passable = true
			
	if body.get_groups().has("commander"):
		commander_in = true


func _on_south1_body_exit( body ):
	if body.get_groups().has("box"):
		s_box_count -= 1
		if s_box_count < 3:
			s_passable = false
			
	if body.get_groups().has("commander"):
		commander_in = false


func _on_west1_body_enter( body ):
	if body.get_groups().has("box"):
		w_box_count += 1
		if w_box_count == 3:
			w_passable = true
			
	if body.get_groups().has("commander"):
		commander_in = true


func _on_west1_body_exit( body ):
	if body.get_groups().has("box"):
		w_box_count -= 1
		if w_box_count < 3:
			w_passable = false
			
	if body.get_groups().has("commander"):
		commander_in = false


func _on_east1_body_enter( body ):
	if body.get_groups().has("box"):
		e_box_count += 1
		if e_box_count == 3:
			e_passable = true
			
	if body.get_groups().has("commander"):
		commander_in = true


func _on_east1_body_exit( body ):
	if body.get_groups().has("box"):
		e_box_count -= 1
		if e_box_count < 3:
			e_passable = false
			
	if body.get_groups().has("commander"):
		commander_in = false
