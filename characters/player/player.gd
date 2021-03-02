extends KinematicBody2D

var MAX_SPEED = 90
const ACCEL = 400
const FRICTION = 800

var velocity = Vector2.ZERO
var roll_vector = Vector2.LEFT

onready var animation_player = $AnimationPlayer
onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")

func get_input_direction():
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), Input.get_action_strength("move_down") - Input.get_action_strength("move_up")).normalized()

func _physics_process(delta):
	$HitboxPivot/SwordHitbox.attack_vector = roll_vector

func move():
	velocity = move_and_slide(velocity)
