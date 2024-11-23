extends State
class_name POIArrival


##TODO make more POIs that do cool stuff
func Enter() -> void:
	owner.velocity = Vector2.ZERO
	#enemy finished at poi
	if EnemySignals.enemyArrivalFinsihed.is_connected(on_enemy_finished):
		pass
	else:
		EnemySignals.enemyArrivalFinsihed.connect(on_enemy_finished)

	if  not (EnemySignals.enemySeesPlayer.is_connected(on_player_sighted)):
		EnemySignals.enemySeesPlayer.connect(on_player_sighted)
	else:
		pass

	
	if owner.current_poi.has_method("on_arrival"):
		owner.current_poi.on_arrival(owner)
	
	#kill enemy
	if  not (EnemySignals.killEnemy.is_connected(on_enemy_dies)):
		EnemySignals.killEnemy.connect(on_enemy_dies)
	else:
		pass

func on_enemy_dies(enemy):
	if enemy == owner:
		transitioned.emit("Dead")

func on_enemy_finished(enemy):
	if enemy == owner:
		transitioned.emit("Patrol")

func on_player_sighted(player):
	owner.last_known_player_pos = player.global_position
	transitioned.emit("Aware")
