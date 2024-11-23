extends State
class_name EnemyIdle
@export_category("Idle Timer")
@export var idle_time_max: float = 1.0
@export var idle_time_min: float = 0.0

@onready var idle_timer: Timer = $idleTimer
var counter:= 0
var head_sprite

func Enter():
	
	head_sprite = get_node("../../Head/headSprite")
	head_sprite.set_trans(false)
	
	counter = 0
	owner.velocity = Vector2.ZERO

func Physics_update(_delta: float) -> void:
	pass
	
func Update(_delta: float) -> void:
	
	
	
	if owner.is_dead:
		transitioned.emit("Dead")
	
	if idle_timer.is_stopped():
		head_sprite.idle_scan()
		#look around while idle
		counter+=1
		idle_timer.start(randf_range(idle_time_min, idle_time_max))
		if (counter >= 4) and head_sprite.get_trans():
			transitioned.emit("Patrol")
#
func Exit():
	head_sprite.kill_idle_tween()
