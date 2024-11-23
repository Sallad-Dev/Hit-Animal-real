extends CPUParticles2D


func _ready() -> void:
	emitting = true
	$Timer.start(lifetime)

func _on_timer_timeout() -> void:
	queue_free()
