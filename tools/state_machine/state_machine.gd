extends Node

class_name StateMachine

var state = null
var previous_state = null
var states = {}

onready var parent = get_parent()

func _physics_process(delta):
	state._update(delta)
		
func new_state(new_state_name):
	print("New State "  + new_state_name)
	if new_state_name == "previous":
		previous_state._exit()
		state = previous_state
	else:
		previous_state = state
		state = states[new_state_name]
		if previous_state != null:
			previous_state._exit()
			
	state._enter()

func add_state(state_name, state_node):
	states[state_name] = state_node
	state_node.connect("finished", self, "new_state")
