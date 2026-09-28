extends CharacterBody2D


const SPEED = 300.0
# There is no jump mechanic in this game, so there is no need for a Jump constant
#const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var forwardDirection := Input.get_axis("Move_Up", "Move_Down")
	if direction:
		velocity.y = forwardDirection * SPEED
	else:
			velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
