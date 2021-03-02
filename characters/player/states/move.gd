extends State

func _handle_input(event):
	if event.is_action_pressed("attack"):
		emit_signal("finished", "attack")
	elif event.is_action_pressed("roll"):
		emit_signal("finished", "roll")

func _update(delta):
	
	var input_dir = owner.get_input_direction()
	if input_dir == Vector2.ZERO:
		emit_signal("finished", "idle")
		return
	owner.roll_vector = input_dir
	
	owner.animation_tree.set("parameters/Idle/blend_position", input_dir)
	owner.animation_tree.set("parameters/Run/blend_position", input_dir)
	owner.animation_tree.set("parameters/Attack/blend_position", input_dir)
	owner.animation_tree.set("parameters/Roll/blend_position", input_dir)
	owner.animation_state.travel("Run")
		
	owner.velocity = owner.velocity.move_toward(input_dir * owner.MAX_SPEED, owner.ACCEL * delta)
			
	owner.move()
