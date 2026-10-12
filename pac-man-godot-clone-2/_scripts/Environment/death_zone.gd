extends Area2D

@onready var timer: Timer = $Timer

signal player_was_killed(player_ko: bool)

@export var player_killed: bool = false

func _on_body_entered(body: CharacterBody2D) -> void:
	var player_killed: bool = true
	player_was_killed.emit(player_killed)
	print("YOU DIED!")
	# Slows down the engine to half speed when hit by an enemy
	Engine.time_scale = 0.5
	# This line of code will remove the collision shape form the player when the player is hit
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
