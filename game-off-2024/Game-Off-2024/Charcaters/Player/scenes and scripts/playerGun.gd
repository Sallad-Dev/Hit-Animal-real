extends Node2D


##TODO change how this works a bit, i think raycasts are a go to.
@onready var gun_sprite: AnimatedSprite2D = $gunSprite
@onready var shot_timer: Timer = $ShotTimer
@onready var gun_sound: AudioStreamPlayer = $GunSound
@onready var emission_point: Node2D = $"Emission Point"

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


#generic shooting func
func shoot_gun():
	if shot_timer.is_stopped():
		create_muzzle_flash(emission_point.global_position)
		var target_dist = (mouse_pos - global_position).normalized()*range_bullet
		#raycast shenanigans
		var space_state = get_world_2d().direct_space_state
		# use global coordinates, not local to node
		var query = PhysicsRayQueryParameters2D.create(owner.global_position, target_dist)
		#make the raycast collide with hurtboxes
		query.set_collide_with_areas(true)
		var result = space_state.intersect_ray(query)
		var pos = result.position
		
		gun_sound.play(0.0)
		if result:
			create_hit_particle(pos)
			var obj = result.collider
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
