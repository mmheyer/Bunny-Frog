extends Area2D

signal coin_collected

func _on_coin_body_entered(body):
	if body.name == "bunnyfrog":
		queue_free()
		emit_signal("coin_collected")
