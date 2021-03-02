extends StateMachine

func _ready():
	add_state("idle", $Idle)
	add_state("move", $Move)
	add_state("attack", $Attack)
	add_state("roll", $Roll)
	state = $Idle
	
func _input(event):
	state._handle_input(event)
