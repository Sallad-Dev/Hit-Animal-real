class_name State
extends Node
 
signal transitioned(new_state_name: StringName)
 
#function that is called on entry to new state
func Enter() -> void:
	pass

#func called on exit of state
func Exit() -> void:
	pass

#update every frame
func Update(_delta: float) -> void:
	pass

 #update with physics tick
func Physics_update(_delta: float) -> void:
	pass
