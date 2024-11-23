extends State
class_name EnemyDead
@onready var body_sprite: AnimatedSprite2D = $"../../BodyParts/Body/bodySprite"
@onready var head_sprite: AnimatedSprite2D = $"../../BodyParts/Head/headSprite"

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")

@export var blood_particle: PackedScene

func Enter():
	owner.velocity = Vector2.ZERO
	
	#lock enemy into dead state
	get_parent().allow_transition = false
	
	
	create_blood_splatter(body_sprite.global_position)
	
	play_dead_anims()
	
	owner.get_node("CollisionShape2D").set_deferred("disabled", true)
	owner.get_node("HurtBox").turn_off()
	
func Update(_delta):
	owner.velocity = Vector2.ZERO

func play_dead_anims():
	body_sprite.z_index = -20
	body_sprite.play("dead")
	head_sprite.play("dead")

func create_blood_splatter(location: Vector2):
	var p = blood_particle.instantiate()
	add_child(p)
	p.global_position = location
