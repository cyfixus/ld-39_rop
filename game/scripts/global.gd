extends Node

var power = 30

signal power_changed
signal game_over

func change_power(change):
	power += change
	emit_signal("power_changed", power)
	print(power)
	if power <= 0:
		emit_signal("game_over")