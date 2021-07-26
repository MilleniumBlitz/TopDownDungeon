extends Button
class_name ButtonMenu

onready var audio_player = $AudioStreamPlayer

func _on_Button_pressed():
	audio_player.play()
