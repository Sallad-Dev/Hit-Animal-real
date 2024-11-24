extends Label


@onready var behaviours: StateMachine = $"../TargetEnemy/Behaviours"




func _process(delta: float) -> void:
	text = str(behaviours.current_state)
