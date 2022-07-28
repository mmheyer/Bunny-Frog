extends Area2D

func _on_Area2D_body_entered(body):
	if body.name == "bunnyfrog":
		queue_free()
		Music.keysound()
