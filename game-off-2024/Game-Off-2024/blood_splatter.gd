extends CPUParticles2D

@onready var timer: Timer = $Timer


func _ready() -> void:
	emitting = true
	timer.start(lifetime)
	direction = Vector2(randf(),randf()).normalized()

func _on_timer_timeout() -> void:
	queue_free()
