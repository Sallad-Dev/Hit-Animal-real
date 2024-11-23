extends Sprite2D

func _ready() -> void:
	#hide the mouse if the cursor is there
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	
	
