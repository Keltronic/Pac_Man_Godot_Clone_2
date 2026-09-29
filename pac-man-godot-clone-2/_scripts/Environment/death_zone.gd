extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: CharacterBody2D) -> void:
	print("YOU DIED!")
	# Slows down the engine to half speed when hit by an enemy
	Engine.time_scale = 0.5
	# This line of code will remove the collision shape form the player when the player is hit
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
