extends Area2D

@onready var game_manager: Node = %GameManager
@onready var _animation_player: AnimationPlayer = $RedPowerAnimation

# Custom signal to inform the game mangaer that the player character has interacted
# with the red powerup coin and is invinsible
signal player_powered_up(powered_up: bool)
signal ghost_can_take_damage(killable_ghost: bool)

@export var player_invincible: bool = false
@export var destructable_enemy: bool = false

func _on_body_entered(body: CharacterBody2D) -> void:
	var player_invincible: bool = true
	var destructable_enemy: bool = true
	game_manager.red_coin_power_up()
	_animation_player.play("Power_Up")
	player_powered_up.emit(player_invincible)
	ghost_can_take_damage.emit(destructable_enemy)
