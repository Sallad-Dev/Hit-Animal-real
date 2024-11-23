extends AnimatedSprite2D


var mouse_pos

func _process(_delta):
	mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	
	if Input.is_action_pressed("action_shoot"):
		play("shoot")
	else:
		play("idle")
