extends State

func _enter():
	owner.wander_timer.start()

func _update(delta):
	if owner.can_see_player():
		emit_signal("finished", "chase")
		
	if owner.is_wander_timer_stop():
		emit_signal("finished", "wander")
		
	owner.velocity = owner.velocity.move_toward(Vector2.ZERO, owner.FRICTION * delta)
#	owner.move()
