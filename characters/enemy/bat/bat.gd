extends KinematicBody2D

var MAX_SPEED = 60
const ACCEL = 500
const FRICTION = 800

var velocity = Vector2.ZERO

var knockback = Vector2.ZERO

onready var player_detection_zone = $PlayerDetection
onready var sprite = $AnimatedSprite
onready var hurtbox = $Hurtbox

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 100 * delta)
	knockback = move_and_slide(knockback)
	
func _on_Hurtbox_area_entered(area):
	set_physics_process(true)
	$Stats.health -= 1
	hurtbox.create_hit_effect()
	knockback = area.attack_vector * 120

func move():
	velocity = move_and_slide(velocity)

func _on_Stats_no_health():
	var death_effect = load("res://characters/enemy/bat/death_effect.tscn").instance()
	death_effect.global_position = global_position
	get_parent().add_child(death_effect)
	queue_free()

func can_see_player():
	return player_detection_zone.player != null

