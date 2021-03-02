extends Node

signal no_health

export(int) var max_healt = 1
export(int) onready  var health = max_healt setget set_health

func set_health(value):
	health = value
	if health == 0:
		emit_signal("no_health")

