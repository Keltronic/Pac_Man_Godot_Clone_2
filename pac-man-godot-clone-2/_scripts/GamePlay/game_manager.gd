extends Node

# Default score variable
@export var player_score: int = 0
#@onready var player: CharacterBody2D = null
#@onready var enemy: Node2D = null
#@onready var red_coin: Area2D = $RedCoin
#@onready var yellow_coin: Area2D = $Coin

# Default power up to kill enemies
var red_coin_power_up: bool

#func _ready():
	#update_player_score()
	#print(update_player_score())

#func update_player_score():
	#if yellow_coin._on_body_entered():
		#player_score += 5
	#elif red_coin._on_body_entered():
		#player_score += 10
