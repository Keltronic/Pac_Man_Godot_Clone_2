extends CharacterBody2D

# Speed is a variable that will be adjusted using a get and set function to change the 
# speed on the fly
@export var speed = 400.0
@export var max_speed: float = 500.0
@export var acceleration: float = 1100.0
@export var deceleration: float = 2500.0
@export var health: int = 1

var enemy_damage: int = 1

# a variable to check if the player has the Red Coin power up active
@export var red_coin_power: bool = false
@onready var _power_up_timer: Timer = $Timer

func _ready() -> void:
	_power_up_timer.timeout.connect(_on_power_up_timer_timeout)

func power_up_active(red_coin_power = true):
	_power_up_timer.start(10.0) # start the timer at 10 seconds
	modulate.a = 0.5

func _on_power_up_timer_timeout():
	if _power_up_timer.is_stopped():
		red_coin_power = false
		modulate.a = 1.0
	else:
		return

func _physics_process(delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("Move_Left", "Move_Right", 
	"Move_Up", "Move_Down")
	
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	move_and_slide()

# If the player is empowered by the red coin, the player will not be killable,
# and can kill the enemies instead
func take_damage():
	if red_coin_power:
		return
