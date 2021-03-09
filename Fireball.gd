extends KinematicBody2D

var direction : Vector2
var velocity = Vector2.ZERO

const ACCEL = 600
const MAX_SPEED = 180

var Effect = preload("res://explosion_effect.tscn")

func _ready():
#	velocity =  (direction * 200)
	$Hitbox.attack_vector = direction
	rotation_degrees = rad2deg(direction.angle())
	
func _physics_process(delta):
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCEL * delta)
#	print(velocity)
	velocity = move_and_slide(velocity)
	
func _on_Hitbox_body_shape_entered(body_id, body, body_shape, area_shape):
	var new_effect = Effect.instance()
	new_effect.global_position = global_position
	get_parent().add_child(new_effect)
	queue_free()
