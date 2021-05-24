extends State

func _handle_input(event):
	if event.is_action_pressed("attack"):
		emit_signal("finished", "attack")

func _enter():
	owner.animation_state.travel("Roll")
	
func _update(delta):
	owner.velocity = owner.roll_vector * 120
	owner.move()
	
func roll_animation_finished():
	emit_signal("finished", "move")
