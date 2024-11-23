extends CPUParticles2D

func _ready() -> void:
	emitting = true
	direction = -direction
	$Timer.start(1)

func _on_timer_timeout() -> void:
	queue_free()
