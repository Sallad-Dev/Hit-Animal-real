extends State
class_name TargetEnemyPatrol

##TODO transition to other states // Other states need to exist first.



func Enter() -> void:
	if owner.poi_list.is_empty():
		owner.reset_poi_list()

	if  not (EnemySignals.killEnemy.is_connected(on_enemy_dies)):
		EnemySignals.killEnemy.connect(on_enemy_dies)
	else:
		pass

	if  not (EnemySignals.enemySeesPlayer.is_connected(on_player_sighted)):
		EnemySignals.enemySeesPlayer.connect(on_player_sighted)
	else:
		pass

func Update(_delta: float) -> void:
	owner.look_at(lerp(owner.global_position, owner.get_current_poi_pos(),0.4))


func Physics_update(delta: float) -> void:
	var poi_to_target = owner.get_current_poi_pos()-owner.global_position
	owner.velocity = poi_to_target.normalized() * owner.speed * delta
	
	if poi_to_target.length() <= 16:
		transitioned.emit("POIArrival")


func on_enemy_dies(enemy):
	if enemy == owner:
		transitioned.emit("Dead")


func on_player_sighted(_player):
	#owner.last_known_player_pos = player.global_position
	transitioned.emit("Aware")
