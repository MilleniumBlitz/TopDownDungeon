extends Area2D

const HitEffect = preload("res://tools/effect/hit_effect.tscn")

onready var timer = $Timer

var invincible = false setget set_invincible

signal invicibility_started
signal invicibility_ended

func set_invincible(value):
	invincible = value
	if invincible:
		emit_signal("invicibility_started")
	else:
		emit_signal("invicibility_ended")

func start_invicibility(duration):
	$Timer.start(duration)
	self.invincible = true

func create_hit_effect():
	var hit_effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(hit_effect)
	hit_effect.global_position = global_position - Vector2(0, 8)


func _on_Timer_timeout():
	self.invincible = false


func _on_Hurtbox_invicibility_started():
	set_deferred("monitorable", false)


func _on_Hurtbox_invicibility_ended():
	set_deferred("monitorable", true)
