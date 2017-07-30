extends Node

var power = 50
var commander_pos = Vector2()

signal power_changed
signal game_over
signal win

func change_power(change):
	power += change
	emit_signal("power_changed", power)
	if power <= 0:
		power = 0
		emit_signal("game_over", 1)
	elif power > 300:
		power = 300