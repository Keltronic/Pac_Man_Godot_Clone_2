class_name Player

extends CharacterBody2D

# Speed is a variable that will be adjusted using a get and set function to change the 
# speed on the fly
@export var speed = 400.0
@export var max_speed: float = 500.0
@export var acceleration: float = 1100.0
@export var deceleration: float = 2500.0
@export var health: int = 1

func _ready() -> void:
	#GlobalVariables.player = self
	pass

func _physics_process(delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down")
	
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	move_and_slide()
