extends Area2D

signal key_collected

func _on_Area2D_body_entered(body):
	if body.name == "bunnyfrog":
		queue_free()
		Music.keysound()
		emit_signal("key_collected")
