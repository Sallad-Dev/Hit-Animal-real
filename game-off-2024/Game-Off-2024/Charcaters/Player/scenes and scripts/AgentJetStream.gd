extends CharacterBody2D
class_name Player


## this is all placeholder, movement will be so much more swag
@export var SPEED = 5000



func _physics_process(delta: float) -> void:

	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED * delta

	move_and_slide()
