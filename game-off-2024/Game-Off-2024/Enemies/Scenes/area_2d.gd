extends Area2D

func take_damage():
	owner.take_damage()


func turn_off():
	$CollisionShape2D.set_deferred("disabled", true)
