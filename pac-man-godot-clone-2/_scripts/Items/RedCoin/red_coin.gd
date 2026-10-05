extends Area2D

@onready var game_manager: Node = %GameManager
@onready var _animation_player: AnimationPlayer = $RedPowerAnimation

func _on_body_entered(body: CharacterBody2D) -> void:
	game_manager.red_coin_power_up()
	_animation_player.play("Power_Up")
