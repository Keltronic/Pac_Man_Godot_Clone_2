extends Node

# Default score variable
@export var playerscore: int = 0
@onready var playerpoints: Label = $"../Environment/PointCollection/PointsCollected"

func yellow_coin_add_point():
	playerscore += 1
	playerpoints.text = " " + str(playerscore)
	
func red_coin_power_up():
	playerscore += 10
	playerpoints.text = " " + str(playerscore)
