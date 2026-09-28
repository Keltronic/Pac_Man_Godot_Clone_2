extends Node

# Default score variable
var coin_score: int = 0

# Default power up to kill enemies
var fruit_power_up: bool

func _add_point():
	coin_score += 1
