extends AnimatedSprite2D

@onready var can_trans:= false

var tween

func _process(_delta):
	if rotation_degrees >= 60:
		rotation_degrees = 0


func idle_scan():
	tween = create_tween()
	tween.tween_property(self, "rotation_degrees", 30, 0.5).as_relative()
	tween.tween_interval(0.2)
	tween.tween_property(self, "rotation_degrees", -60, 0.5).as_relative()
	await tween.finished
	set_trans(true)


func head_origin(target: Vector2):
	look_at(target)

func get_trans():
	return can_trans

func set_trans(tf: bool):
	can_trans = tf

func kill_idle_tween():
	if tween:
		tween.kill()
