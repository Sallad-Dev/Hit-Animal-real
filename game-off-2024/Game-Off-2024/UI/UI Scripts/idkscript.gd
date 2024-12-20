extends Control

@onready var confirmSound = $confirmsound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	confirmSound.play()
	await get_tree().create_timer(1.5).timeout
	get_tree().change.scene()


func _on_options_button_pressed() -> void:
	confirmSound.play()
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")
	

func _on_quit_button_pressed() -> void:
	confirmSound.play()
	await get_tree().create_timer(1.5).timeout
	get_tree().quit()
