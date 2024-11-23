extends Area2D
class_name Bullet
@export_group("Stats")
@export var bullet_speed:= 100
#generic scripting for a bullet, can be used by enemies and player

@onready var shoot_dir:Vector2
		
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	shoot_dir = (get_global_mouse_position() - global_position).normalized()

func _physics_process(delta: float) -> void:
	global_position += bullet_speed * delta * shoot_dir


func _on_body_entered(body):
	print(body)
	if body.has_method("take_damage"):
		body.take_damage()
		queue_free()
	#queue_free()
