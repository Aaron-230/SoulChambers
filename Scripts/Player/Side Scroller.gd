extends CharacterBody2D

const WALK_SPEED = 200.0
const RUN_SPEED = 400.0
const JUMP_VELOCITY = -250.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var Sprite = $Sprite
@onready var timer = $Timer

func _physics_process(delta):
	var direction = Input.get_axis("Left", "Right")
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var is_running = Input.is_action_pressed("Run")
	var current_speed = RUN_SPEED if is_running else WALK_SPEED
	
	if direction:
		velocity.x = direction * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)

	move_and_slide()
	
	update_animations(direction, is_running)

func update_animations(direction, is_running):
	if direction != 0:
		Sprite.flip_h = (direction < 0)
	
	if velocity.x == 0:
		Sprite.play("Idle")
	else:
		if is_running:
			Sprite.play("Running")
		else:
			Sprite.play("Walking")
