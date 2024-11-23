extends State
class_name TargetEnemyPatrol

##TODO transition to other states // Other states need to exist first.


func Enter() -> void:
	if owner.poi_list.is_empty():
		reset_poi_list()
	set_next_poi()
	owner.look_at(get_current_poi_pos())
	
	if  not (EnemySignals.killEnemy.is_connected(on_enemy_dies)):
		EnemySignals.killEnemy.connect(on_enemy_dies)
	else:
		pass

	if  not (EnemySignals.enemySeesPlayer.is_connected(on_player_sighted)):
		EnemySignals.enemySeesPlayer.connect(on_player_sighted)
	else:
		pass

func Update(_delta: float) -> void:
	pass


func Physics_update(delta: float) -> void:
	var poi_to_target = get_current_poi_pos()-owner.global_position
	owner.velocity = poi_to_target.normalized()*owner.speed*delta
	
	if poi_to_target.length() <= 16:
		transitioned.emit("POIArrival")


func on_enemy_dies(enemy):
	if enemy == owner:
		transitioned.emit("Dead")


func on_player_sighted(player):
	owner.last_known_player_pos = player.global_position
	transitioned.emit("Aware")


#setters and getters
func get_poi_list():
	return owner.poi_list

func reset_poi_list():
	owner.poi_list = owner.POI.duplicate()

func get_current_poi():
	return owner.current_poi

func set_next_poi():
	owner.current_poi = owner.poi_list.pop_front()

func set_current_poi(poi: PointOfInterest):
	owner.current_poi = poi

func add_new_poi_front(poi: PointOfInterest):
	owner.poi_list.push_front(poi)

func get_current_poi_pos():
	return owner.current_poi.global_position


func set_current_poi_pos(vect:Vector2):
	owner.current_poi_pos = vect
