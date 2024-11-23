extends State
class_name EnemyInspecting

func Enter():
	owner.velocity = Vector2.ZERO



func Update(_delta: float) -> void:
	if owner.is_dead:
		transitioned.emit("Dead")
