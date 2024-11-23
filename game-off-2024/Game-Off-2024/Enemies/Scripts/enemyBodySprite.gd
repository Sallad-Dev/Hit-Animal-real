extends AnimatedSprite2D



func _physics_process(_delta):
	
	#body rotates independently 
	rotate(lerp_angle(0, get_angle_to(owner.facing_dir*1000), 0.5))
	#look_at(owner.direction.normalized()*100)
	pass
