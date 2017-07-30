extends Node

var power = 30
var commander_pos = Vector2()

signal power_changed
signal game_over

func change_power(change):
	power += change
	emit_signal("power_changed", power)
	if power <= 0:
		emit_signal("game_over")
	elif power > 300:
		power = 300
	print(power)