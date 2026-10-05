extends Node2D

# Constant values in the script
const speed: float = 60.0

# Regular variables in the script
var direction: Vector2 = Vector2.DOWN

# These variables are used to call on each ray coast node labeled RayCastUp, 
# RayCastDown, RayCastLeft, and RayCastRight
# as well as the animated sprite node
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction.x = 1
		animated_sprite.flip_h = false
	if ray_cast_left.is_colliding():
		direction.x = -1
		animated_sprite.flip_h = true
	if ray_cast_up.is_colliding():
		direction.y = 1
		animated_sprite.flip_h = false
	if ray_cast_down.is_colliding():
		direction.y = -1
		animated_sprite.flip_h = false
	position += direction * speed * delta

func _on_player_detection_body_entered(body: CharacterBody2D) -> void:
	pass # Replace with function body.
