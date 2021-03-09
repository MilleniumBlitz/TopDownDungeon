extends KinematicBody2D

var MAX_SPEED = 90
const ACCEL = 400
const FRICTION = 800

var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN

onready var animation_player = $AnimationPlayer
onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")

var deadzone = 0.3
var controllerangle = Vector2.ZERO

func _input(event):
	var xAxisRL = Input.get_joy_axis(0, JOY_AXIS_2)
	var yAxisUD = Input.get_joy_axis(0 ,JOY_AXIS_3)
	if abs(xAxisRL) > deadzone || abs(yAxisUD) > deadzone:
		if $ShootTimer.is_stopped():
			shoot(Vector2(xAxisRL, yAxisUD).normalized())

func get_input_direction():
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), Input.get_action_strength("move_down") - Input.get_action_strength("move_up")).normalized()

func _physics_process(delta):
	$HitboxPivot/SwordHitbox.attack_vector = roll_vector

func shoot(direction):
	$ShootTimer.start()
	
	
	# INSTANCE FIREBALL
	var fb = load("res://Fireball.tscn").instance()
	fb.direction = direction
	fb.global_position = global_position + (direction * 25)
	get_tree().current_scene.add_child(fb)

func move():
	velocity = move_and_slide(velocity)
