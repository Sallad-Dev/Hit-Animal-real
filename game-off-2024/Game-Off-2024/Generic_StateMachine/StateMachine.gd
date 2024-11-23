class_name StateMachine
extends Node
 

@export var current_state: State
var states: Dictionary = {}
var allow_transition: bool = true
func _ready():
	#on ready gets child and checks if state
	for child in get_children():
		if child is State:
			states[child.name] = child
			#connects transition signal to child state
			child.transitioned.connect(on_child_transitioned)
		else:
			push_warning("State machine contains child which is not 'State'")
	#enter current state
	current_state.Enter()


func _process(delta):
	#update every frame
	current_state.Update(delta)

func _physics_process(delta):
	#update every physics tick
	current_state.Physics_update(delta)


func on_child_transitioned(new_state_name: StringName) -> void:
	if allow_transition:
		#transition to new state
		var new_state = states.get(new_state_name)
		if new_state != null:
			if new_state != current_state:
				current_state.Exit()
				new_state.Enter()
				current_state = new_state
	
		else:
			push_warning("Called transition on a state that does not exist")
	else:
		pass
