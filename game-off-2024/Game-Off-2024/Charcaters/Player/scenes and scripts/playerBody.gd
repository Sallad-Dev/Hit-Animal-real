extends Node2D

@onready var body_sprite: AnimatedSprite2D = $bodySprite

var mouse_pos

func _process(_delta):
	mouse_pos = get_global_mouse_position()
	#body rotates independently 
	rotate(lerp_angle(0, get_angle_to(mouse_pos), 0.35))
	
	if Input.is_action_pressed("action_shoot"):
		body_sprite.play("shoot")
	else:
		body_sprite.play("idle")
