extends StateMachine

func _ready():
	add_state("wander", $Wander)
	add_state("chase", $Chase)
	state = $Wander
	
func _input(event):
	state._handle_input(event)
