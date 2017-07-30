extends Node2D

func _ready():
	for i in range(1,20):
		get_node("sentry_%s/sentry/anim" %i).set_speed(rand_range(1,4))
