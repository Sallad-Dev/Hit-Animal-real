extends State
class_name EnemyAware

func Enter():
	owner.reset_head_sprite()
	
	if owner.tween:
		if owner.tween.is_running():
			owner.tween.kill() 

	if  not (EnemySignals.enemySeesPlayer.is_connected(on_player_sighted)):
		EnemySignals.enemySeesPlayer.connect(on_player_sighted)
	else:
		pass
	
func Physics_update(delta: float) -> void:
	var dist_from_point = (owner.last_known_player_pos - owner.global_position).length()
	if dist_from_point <= 8:
		owner.velocity = Vector2.ZERO
		transitioned.emit("Patrol")
	else:
		owner.velocity = (owner.last_known_player_pos - owner.global_position).normalized()*owner.speed*delta
	owner.look_at(owner.last_known_player_pos)


func on_player_sighted(player):
	owner.last_known_player_pos = player.global_position
