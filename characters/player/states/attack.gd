extends State

func _handle_input(event):
	if event.is_action_pressed("roll"):
		emit_signal("finished", "roll")

func _enter():
	owner.animation_state.travel("Attack")

func _update(delta):
	owner.velocity = owner.velocity.move_toward(Vector2.ZERO, 200 * delta)
	owner.move()

func attack_animation_finished():
	emit_signal("finished", "move")
	
