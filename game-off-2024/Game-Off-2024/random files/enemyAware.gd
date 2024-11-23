extends State
class_name EnemyAware

func Enter():
	if owner.tween:
		if owner.tween.is_running():
			owner.tween.kill() 

	if  not (EnemySignals.playerOutOfSight.is_connected(on_player_out_of_sight)):
		EnemySignals.playerOutOfSight.connect(on_player_out_of_sight)
	else:
		pass
	
	if  not (EnemySignals.enemySeesPlayer.is_connected(on_player_sighted)):
		EnemySignals.enemySeesPlayer.connect(on_player_sighted)
	else:
		pass
	
func Physics_update(delta: float) -> void:
	var dist_from_point = (owner.last_known_player_pos - owner.global_position).length()
	if dist_from_point <= 4:
		owner.velocity = Vector2.ZERO
		await get_tree().create_timer(1).timeout
		transitioned.emit("Patrol")
	else:
		owner.velocity = (owner.last_known_player_pos - owner.global_position).normalized()*owner.speed*delta
	owner.look_at(owner.last_known_player_pos)
	
func on_player_out_of_sight():
	%Patrol.add_new_poi_front(%Patrol.get_current_poi())
	transitioned.emit("Patrol")

func on_player_sighted(player):
	owner.last_known_player_pos = player.global_position
