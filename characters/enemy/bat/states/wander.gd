extends State

var wander_range = 100
var end_position

const TOLERANCE = 4

func _enter():
	var start_position = owner.global_position
	end_position = start_position + Vector2(rand_range(-wander_range, wander_range), rand_range(-wander_range, wander_range))

func _exit():
	owner.wander_timer.start()
	
func _update(delta):
		
	var direction = owner.global_position.direction_to(end_position)
	owner.velocity = owner.velocity.move_toward(direction * owner.MAX_SPEED, owner.ACCEL * delta)
#	owner.velocity = owner.velocity.move_toward(direction, owner.ACCEL * delta)
	owner.move()
	
	owner.sprite.flip_h = owner.velocity.x < 0

	if owner.global_position.distance_to(end_position) <= TOLERANCE:
		emit_signal("finished", "idle")
	
	if owner.can_see_player():
		emit_signal("finished", "chase")

