extends Node2D

@onready var sight_timer: Timer = $SightTimer

var colliding: bool = false

func _process(_delta: float) -> void:
	for i in get_children():
		if i is RayCast2D and i.is_colliding():
			var obj = i.get_collider()
			if obj is Player:
				sight_timer.stop()
				EnemySignals.enemySeesPlayer.emit(obj)
			else:
				sight_timer.start(0.85)

func _on_sight_timer_timeout() -> void:
	EnemySignals.playerOutOfSight.emit()
