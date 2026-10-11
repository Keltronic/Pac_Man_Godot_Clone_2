extends CharacterBody2D

# Speed is a variable that will be adjusted using a get and set function to change the 
# speed on the fly
@export var speed = 400.0
@export var max_speed: float = 500.0
@export var acceleration: float = 1100.0
@export var deceleration: float = 2500.0
@export var health: int = 1
@export var invincibility_nodes: Array[Node] = []

func _ready() -> void:
	for Node in invincibility_nodes:
		if Node and Node.has_signal("player_powered_up"):
			Node.player_powered_up.connect(_player_invincibility)

func _physics_process(delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down")
	
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	move_and_slide()
	
func _player_invincibility(player_invincible):
	print("Player is an indestructable master of war!")
