extends State

var wander_range = 100
var end_position

func _enter():
	var start_position = owner.global_position
	end_position = start_position + Vector2(rand_range(-wander_range, wander_range), rand_range(-wander_range, wander_range))

func _exit():
	owner.wander_timer.start()
	
func _update(delta):
	
#	var direction = owner.global_position.direction_to(end_position)
	var direction = arrive(end_position)
#	owner.velocity = owner.velocity.move_toward(direction * owner.MAX_SPEED, owner.ACCEL * delta)
#	print(direction)
	owner.velocity = owner.velocity.move_toward(direction, owner.ACCEL * delta)
	owner.move()
	
	owner.sprite.flip_h = owner.velocity.x < 0
	print(owner.velocity)
	
	if owner.velocity == Vector2.ZERO:
		emit_signal("finished", "idle")
	
	#if owner.global_position.distance_to(end_position) <= 4:
		#emit_signal("finished", "idle")
	
	if owner.can_see_player():
		emit_signal("finished", "chase")

func arrive(target):
#	var direction : Vector2 = owner.global_position.direction_to(target)
	var direction = target - owner.global_position

	#The distance is the magnitude of
	#the vector pointing from
	#location to target.
	var d = direction.length()
	direction = direction.normalized()
	# If we are closer than 100 pixels...
	if (d < 20):
		# [full] ...set the magnitude
		# according to how close we are.
		#var  m = map(d, 0, 100, 0, owner.MAX_SPEED)
		var m = remap_range(d, 0, 100, 0, owner.MAX_SPEED)
		direction = direction * m
		# [end]
	else:
		# Otherwise, proceed at maximum speed.
		direction = direction * owner.MAX_SPEED
	
	return direction
	# The usual steering = desired - velocity
	#var steer = PVector.sub(desired,velocity)
	#steer.limit(maxforce)
	#applyForce(steer)
	
func remap_range(value, InputA, InputB, OutputA, OutputB):
	return(value - InputA) / (InputB - InputA) * (OutputB - OutputA) + OutputA
