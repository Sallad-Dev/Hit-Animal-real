extends State
class_name TargetEnemyIdle

func Enter() -> void:
	owner.velocity = Vector2.ZERO
	get_tree().create_timer(0.1).connect("timeout", on_timer_timeout)
	if  not (EnemySignals.killEnemy.is_connected(on_enemy_dies)):
		EnemySignals.killEnemy.connect(on_enemy_dies)
	else:
		pass

func on_enemy_dies(enemy):
	if enemy == owner:
		transitioned.emit("Dead")

func on_timer_timeout():
	transitioned.emit("Patrol")
