extends CharacterBody2D

@export var SPEED = 200.0

@onready var animated_sprite = $Sprite

var last_direction = "Left"

func _physics_process(_delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		update_direction_string(direction)
	else:
		velocity = Vector2.ZERO

	move_and_slide()
	update_animations(direction)

func update_direction_string(dir):
	if abs(dir.y) > abs(dir.x):
		last_direction = "Up" if dir.y < 0 else "Down"
	else:
		last_direction = "Left" if dir.x < 0 else "Right"

func update_animations(direction):
	if direction != Vector2.ZERO:
		animated_sprite.play("Walk " + last_direction)
	else:
		# Play: idle_up, idle_down, idle_left, or idle_right
		animated_sprite.play("Idle " + last_direction)
