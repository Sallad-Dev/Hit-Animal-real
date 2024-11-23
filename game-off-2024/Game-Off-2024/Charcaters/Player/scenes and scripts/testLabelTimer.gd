extends Label
@onready var shot_timer: Timer = $"../Gun/ShotTimer"

func _process(delta: float) -> void:
	text = str(shot_timer.time_left)
