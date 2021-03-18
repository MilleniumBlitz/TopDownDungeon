extends State

func _update(delta):
	if owner.can_see_player():
		emit_signal("finished", "chase")
		
	owner.velocity = owner.velocity.move_toward(Vector2.ZERO, owner.FRICTION * delta)
	owner.move()
