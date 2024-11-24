extends Control

@onready var confirmsound: AudioStreamPlayer2D = $menu_cursor/confirmsound

func _ready() -> void:
	$VBoxContainer/OptionsButton.grab_focus()

func _on_back_pressed():
	confirmsound.play()
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://Game-Off-2024/UI/UI Scenes/menu.tscn")
