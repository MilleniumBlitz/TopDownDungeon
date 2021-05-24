extends State

func _enter():
	owner.animation_state.travel("Idle")
	
func _handle_input(event):
	if event.is_action_pressed("attack"):
		emit_signal("finished", "attack")
	elif event.is_action_pressed("roll"):
		emit_signal("finished", "roll")

func _update(delta):
	
	owner.velocity = owner.velocity.move_toward(Vector2.ZERO, owner.FRICTION * delta)

	if owner.get_input_direction() != Vector2.ZERO:
		emit_signal("finished", "move")
