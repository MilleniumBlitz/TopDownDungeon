extends StateMachine

func _ready():
	add_state("idle", $Idle)
	add_state("wander", $Wander)
	add_state("chase", $Chase)
	state = $Idle
	
func _input(event):
	state._handle_input(event)
