extends CharacterBody2D
class_name TargetEnemy

##TODO enemy object avoidance.

@export_group("Stats")
@export var health = 100
@export var speed = 500


@export_group("Points of interest")
@export var POI: Array[PointOfInterest]

@onready var head_sprite: AnimatedSprite2D = $BodyParts/Head/headSprite
@onready var behaviours: StateMachine = $Behaviours

var last_known_player_pos: Vector2
var poi_list: Array
var current_poi: PointOfInterest
var current_poi_pos: Vector2

var tween: Tween

func _ready() -> void:
	#shallow copy of POI
	poi_list = POI.duplicate()

	if poi_list.is_empty():
		reset_poi_list()
	set_next_poi()

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:

	move_and_slide()

#take da damage
func take_damage():
	EnemySignals.killEnemy.emit(self)

#survey the area by rotating the enemies head
func poi_survey():
	tween = create_tween()
	tween.tween_property(head_sprite, "rotation_degrees", 55,0.75).as_relative()
	tween.tween_property(head_sprite, "rotation_degrees", 0,0.75)
	tween.tween_interval(0.5)
	tween.tween_property(head_sprite, "rotation_degrees",-55,0.75).as_relative()
	tween.tween_property(head_sprite, "rotation_degrees", 0,0.75)
	tween.tween_interval(0.2)
	if behaviours.current_state == EnemyDead:
		tween.kill()
		return
	await tween.finished
	EnemySignals.enemyArrivalFinsihed.emit(self)


# POI setters and getters
func get_poi_list():
	return poi_list

func reset_poi_list():
	poi_list = POI.duplicate()

func get_current_poi():
	return current_poi

func set_next_poi():
	current_poi = poi_list.pop_front()

func set_current_poi(poi: PointOfInterest):
	current_poi = poi

func add_new_poi_front(poi: PointOfInterest):
	poi_list.push_front(poi)

func get_current_poi_pos():
	return current_poi.global_position

func set_current_poi_pos(vect:Vector2):
	current_poi_pos = vect
