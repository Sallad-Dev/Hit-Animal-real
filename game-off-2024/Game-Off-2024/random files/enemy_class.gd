extends CharacterBody2D
class_name EnemyClass

#generic enemy class
@export_category("Stats")
@export var health = 100
@export var SPEED = 500

@export_category("Points of interest")
@export var POI: Array[PointOfInterest]

@onready var is_dead:= false
var patrol_list: Array

#direction the enemy is moving
var direction: Vector2
#directio  the enemy is facing
var facing_dir: Vector2

func _ready() -> void:
	patrol_list = POI.duplicate()

func take_damage():
	#print("dies lmao")
	is_dead = true
	
func _process(_delta: float) -> void:
	#look_at(facing_dir)
	pass

func _physics_process(_delta: float) -> void:

	#just move the enemy whereever a state says to
	move_and_slide()
