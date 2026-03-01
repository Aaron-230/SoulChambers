extends Node2D

var SPEED = 1
var direction = 1

@onready var ray_cast_right = $"RayCast Right"
@onready var ray_cast_left = $"RayCast Left"

func _process(delta):
	if ray_cast_right.is_colliding():
		direction=-1
	if ray_cast_left.is_colliding():
		direction = 1

	position.x += direction * SPEED + delta
