extends State
class_name EnemyAware

func Enter():
	if owner.tween.is_running():
		owner.tween.stop() 

	if  not (EnemySignals.playerOutOfSight.is_connected(on_player_out_of_sight)):
		EnemySignals.playerOutOfSight.connect(on_player_out_of_sight)
	else:
		pass
	
func Physics_update(delta: float) -> void:
	owner.velocity = (owner.last_known_player_pos - owner.global_position).normalized()*owner.speed*delta
	owner.look_at(owner.last_known_player_pos)
	
func on_player_out_of_sight():
	%Patrol.add_new_poi_front(%Patrol.get_current_poi())
	transitioned.emit("Patrol")
