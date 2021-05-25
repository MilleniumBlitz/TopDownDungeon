extends Control

var hearts = 4 setget set_hearts
var max_hearts = hearts setget set_max_hearts

onready var heartui_empty = $HeartUIEmpty
onready var heartui_full = $HeartUIFull

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	heartui_full.rect_size.x = hearts * 15
	
func set_max_hearts(value):
	max_hearts = max(value, 1)
	heartui_empty.rect_size.x = max_hearts * 15
	
func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	PlayerStats.connect("health_changed", self, "set_hearts")
	PlayerStats.connect("max_health_changed", self, "set_max_hearts")
