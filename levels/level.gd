extends Node2D

onready var Player = preload("res://characters/player/player.tscn")

func _ready():
	var new_player = Player.instance()
#	$YSort.add_child(new_player)
