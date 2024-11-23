extends RayCast2D

var colliding: bool = false

func _process(_delta: float) -> void:
	if is_colliding():
		var obj = get_collider()
		if obj is Player:
			EnemySignals.enemySeesPlayer.emit(obj)
		else:
			get_tree().create_timer(1.0).timeout.connect(on_timer_timeout)
			

func on_timer_timeout():
	EnemySignals.playerOutOfSight.emit()
