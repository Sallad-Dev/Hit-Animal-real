extends Node2D
class_name Gun


@export_group("Ammo")
@export var bullet: PackedScene
@export var fire_rate: float = 0.5

var allow_shoot:= true


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("action_shoot") and allow_shoot:
		shoot()

func _process(delta: float) -> void:
	rotate(lerp_angle(0, get_angle_to(get_global_mouse_position()), 0.25))
	
func shoot():
	get_tree().create_timer(fire_rate).timeout.connect(on_fire_rate_timeout)
	var b = bullet.instantiate()
	owner.add_child(b)
	b.set_transform(owner.global_transform)

	allow_shoot = false

func on_fire_rate_timeout():
	allow_shoot = true
