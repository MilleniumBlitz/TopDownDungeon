extends Node2D

onready var Effect = preload("res://assets/terrain/grass_effect.tscn")

func _on_Hurtbox_area_entered(area):
	var new_effect = Effect.instance()
	new_effect.global_position = global_position
	get_tree().get_root().add_child(new_effect)
	queue_free()
