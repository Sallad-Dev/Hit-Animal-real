extends Node2D


##TODO change how this works a bit, i think raycasts are a go to.
@onready var gun_sprite: AnimatedSprite2D = $gunSprite
@onready var shot_timer: Timer = $ShotTimer
@onready var gun_sound: AudioStreamPlayer = $GunSound
@onready var emission_point: Node2D = $"Emission Point"
@onready var gun_ray: RayCast2D = $GunRay

var mouse_pos
@export_group("Gun Stuff")
@export var range_bullet: int = 1000
@export var fire_rate: float = 0.5
@export var hit_particle: PackedScene
@export var muzzle_flash: PackedScene



func _process(_delta):
	mouse_pos = get_global_mouse_position()
	#gun rotates independently 
	rotate(lerp_angle(0, get_angle_to(mouse_pos), 0.25))
	
	if Input.is_action_pressed("action_shoot") :
		gun_sprite.play("shoot")
		shoot_gun()
	else:
		gun_sprite.play("idle")


#shoota da gun
func shoot_gun():
	if shot_timer.is_stopped():
		gun_sound.play(0.0)
		create_muzzle_flash(emission_point.global_position)
		create_hit_particle(gun_ray.get_collision_point())
		if gun_ray.is_colliding():
			var obj = gun_ray.get_collider()
			if obj.has_method("take_damage"):
				obj.take_damage()
		
		shot_timer.start(fire_rate)


func create_hit_particle(location: Vector2):
	var p = hit_particle.instantiate()
	add_child(p)
	p.global_position = location

func create_muzzle_flash(location: Vector2):
	var p = muzzle_flash.instantiate()
	add_child(p)
	p.global_position = location
