extends State

#func _ready() -> void:
	#if  not (EnemySignals.killEnemy.is_connected(on_enemy_dies)):
		#EnemySignals.killEnemy.connect(on_enemy_dies)
	#else:
		#pass
#
#func on_enemy_dies(enemy):
	#if enemy == owner:
		#transitioned.emit("Dead")
