extends Control

func _ready():
	
	#Focus on the first button
	$CenterContainer/VBoxContainer/NewGameBtn.grab_focus()

func _on_NewGameBtn_pressed():
	get_tree().change_scene("res://levels/level.tscn")


func _on_LoadGameBtn_pressed():
	pass # Replace with function body.


func _on_LeaveGameBtn_pressed():
	get_tree().quit()
