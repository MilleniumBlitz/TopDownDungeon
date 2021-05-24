extends State

func _update(delta):
	var player = owner.player_detection_zone.player
	if player != null:

		var direction = owner.global_position.direction_to(player.global_position)
		owner.velocity = owner.velocity.move_toward(direction *  owner.MAX_SPEED, owner.ACCEL * delta)
		owner.move()
		
	else:
		emit_signal("finished", "wander")
		
	owner.sprite.flip_h = owner.velocity.x < 0
