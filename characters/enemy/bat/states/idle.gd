extends State

func _enter():
	owner.wander_timer.start(rand_range(1,3))

func _update(delta):
	if owner.can_see_player():
		emit_signal("finished", "chase")
		
	if owner.is_wander_timer_stop():
		emit_signal("finished", "wander")
