extends Node2D

@onready var head_sprite: AnimatedSprite2D = $headSprite

var mouse_pos

func _process(_delta):
	mouse_pos = get_global_mouse_position()
	#head rotates independently 
	rotate(lerp_angle(0, get_angle_to(mouse_pos), 0.1))
