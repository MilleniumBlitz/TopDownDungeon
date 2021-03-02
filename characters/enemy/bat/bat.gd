extends KinematicBody2D

var knockback = Vector2.ZERO

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 100 * delta)
	knockback = move_and_slide(knockback)
	
func _on_Hurtbox_area_entered(area):
	set_physics_process(true)
	$Stats.health -= 1
	knockback = area.attack_vector * 100


func _on_Stats_no_health():
	var death_effect = load("res://characters/enemy/bat/death_effect.tscn").instance()
	death_effect.global_position = global_position
	get_parent().add_child(death_effect)
	queue_free()
