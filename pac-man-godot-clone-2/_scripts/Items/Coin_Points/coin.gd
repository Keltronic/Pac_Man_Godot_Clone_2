extends Area2D

@onready var game_manager: Node = %GameManager
@onready var _animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: CharacterBody2D) -> void:
	game_manager.yellow_coin_add_point()
	_animation_player.play("Pickup_Animation")
