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

#func _ready() -> void:
	#var random_x = [-1.0, 1.0].pick_random()
	#var random_y = [-1.0, 1.0].pick_random()
	
	#velocity = Vector2(random_x, random_y).normalized() * speed

func _physics_process(delta: float) -> void:
	# 3. Move the character while checking for an automatic collision object
	# move_and_collide takes the velocity multiplied by delta
	#var collision_info = move_and_collide(velocity * delta)
	
	# 4. If it runs into a wall, bounce the velocity vector off the obstacle normal
	#if collision_info:
		#var wall_normal = collision_info.get_normal()
		#velocity = velocity.bounce(wall_normal)
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

# Called every frame, 'delta' is the elapsed time since the previous frame
#func _process(delta: float) -> void:
	#if ray_cast_right.is_colliding():
		#direction.x = -1
		#animated_sprite.flip_h = true
	#if ray_cast_left.is_colliding():
		#direction.x = 1
		#animated_sprite.flip_h = false
	#if ray_cast_up.is_colliding():
		#direction.y = 1
		#animated_sprite.flip_h = false
	#if ray_cast_down.is_colliding():
		#direction.y = -1
		#animated_sprite.flip_h = false
	#position += direction * speed * delta
