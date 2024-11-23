extends State
class_name EnemyPatrol
#a state where the enemy patrols between points of interest within their list.


var current_poi: PointOfInterest
var dist_from_poi
var current_poi_pos: Vector2
var head_sprite

func Enter():
	head_sprite = get_node("../../Head/headSprite")
	if owner.patrol_list.is_empty():
		new_patrol_list()
	else:
		next_poi()
		next_poi_pos()


func Update(_delta: float) -> void:
	head_sprite.head_origin(current_poi_pos)
	if owner.is_dead:
		transitioned.emit("Dead")
	
	dist_from_poi = (current_poi_pos - owner.global_position).length()

	if dist_from_poi <= 16:
		transitioned.emit("Idle")

func Physics_update(delta):
	owner.facing_dir = (current_poi_pos - owner.global_position).normalized()
	owner.velocity =  delta * owner.SPEED * owner.facing_dir


func new_patrol_list():
	owner.patrol_list = owner.POI.duplicate()

func next_poi():
	current_poi = owner.patrol_list.pop_front()

func next_poi_pos():
	current_poi_pos = current_poi.global_position

func set_poi_pos():
	current_poi_pos = current_poi.global_position
	return current_poi_pos
