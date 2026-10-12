extends CharacterBody2D

## Configure the game manager to pull in the number of lives
@onready var game_management: Node = %GameManager
## Speed is a variable that will be adjusted using a 
## get and set function to change the speed on the fly
@export var speed = 400.0
## Max Speed is a variable that informs Godot on how 
## fast the player character can move around the map
@export var max_speed: float = 500.0
## Acceleration is a variable that will cause the player character 
## to move to the max speed variable swiftly or slowly
@export var acceleration: float = 1100.0
## Deceleration is a variable that will cuase the player to slow down 
## to 0.0 when the player is not adding any input information 
## to the player character
@export var deceleration: float = 2500.0
## Health will be set to a max of one to cause the player 
## to be harmed by the enemies causing a one-shot kill
@export var health: int = 1
## An array of nodes that will contain all of the nodes in the map that will 
## send the player_powered_up signal and ghost_can_take_damage signal 
## to the player character and the enemies
@export var invincibility_nodes: Array[Node] = []
## Constant variable for the invincibility timer.
## While time is greater than 0.0 the player cannot be killed by the enemies
## and the enemies can be killed by the player
const invincibility_time: float = 10.0
## Initialize the timer node on the player characeter to limit the
## amount of time the player can be invincible and kill the enemies
@onready var invincibility_timer: Timer = $Timer
## An array of Node2D objects taht will be used to trigger the death
## animation on the player
@export var kill_player_ghost_nodes: Array[Node2D] = []
## pulls in the animation sprite from the player character
@onready var sprite_animation: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	# a for loop to 
	for Node in invincibility_nodes:
		if Node and Node.has_signal("player_powered_up"):
			Node.player_powered_up.connect(_player_invincibility)
			invincibility_timer.start(invincibility_time)
	for Node2D in kill_player_ghost_nodes:
		if Node2D and Node2D.has_signal("player_killed"):
			Node2D.player_killed.connect(_player_is_dead)

## This function takes in input from the players keyboard to move the character
## then interact with the physics of the map and other nodes that have physics
func _physics_process(delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down")
	
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	move_and_slide()
	
func _player_invincibility(player_invincible):
	print("Player is an indestructable master of war!")

func _player_is_dead(player_killed):
	if player_killed:
		sprite_animation.play("Death")
