extends Area2D

var player = null

func _on_PlayerDetection_body_entered(body):
	player = body
	print("Bonjour " + body.name)

func _on_PlayerDetection_body_exited(body):
	player = null
	print("Aurevoir " + body.name)
