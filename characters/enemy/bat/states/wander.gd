extends State

var wander_range = 2400

func _enter():
	owner.velocity = owner.velocity.move_toward(Vector2(rand_range(-wander_range, wander_range), rand_range(-wander_range, wander_range)) * owner.MAX_SPEED, owner.ACCEL * 0.5)
	owner.move()
#	emit_signal("finished", "idle")

func _exit():
	owner.wander_timer.start()
	
	

func _update(delta):
	owner.velocity = owner.velocity.move_toward(Vector2.ZERO, owner.FRICTION * delta)
	owner.move()
	if owner.can_see_player():
		emit_signal("finished", "chase")
#	print(owner.velocity)
#	if owner.velocity == Vector2.ZERO:
#		print("otot")
#		emit_signal("finished", "idle")
#
#	if owner.is_wander_timer_stop():
#		print("oui")
#
#		owner.wander_timer.start()
##	emit_signal("finished", "idle")
