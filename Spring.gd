extends Area2D

func _on_Spring_body_entered(body):
	if body.name == "bunnyfrog":
		Music.spring()
		body.velocity.y = -650
