extends CharacterBody2D

@export var sprite: AnimatedSprite2D

var god_mode: bool = false
var is_swimming: bool = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var selected_rotation_group = 0
var double_jump_available = true

func teleport(new_position: Vector2) -> void:
	position = new_position

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("god_mode"):
		god_mode = !god_mode
		set_collision_mask_value(1, true)
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			double_jump_available = true
		elif double_jump_available:
			velocity.y = JUMP_VELOCITY
			double_jump_available = false
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		sprite.flip_h = direction < 0
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	sprite.flip_v = false
	
	if Input.is_action_pressed("down"):
		if Input.is_action_just_pressed("down"):
			velocity.y = get_gravity().y
		
		velocity += 2 * get_gravity() * delta
		
		sprite.flip_v = true
	
	if is_swimming:
		velocity.x *= 0.5
		velocity.y *= 0.5
		
		double_jump_available = true
	
	if god_mode:
		set_collision_mask_value(1, false)
		
		velocity.x = 0
		velocity.y = 0
		
		velocity.x = direction * SPEED
		
		var y_direction := Input.get_axis("jump", "down")
		if y_direction:
			velocity.y = y_direction * SPEED
	
	move_and_slide()
