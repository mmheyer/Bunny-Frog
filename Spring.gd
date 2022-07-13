extends Area2D


func _on_Spring_body_entered(body):
	if body.name == "bunnyfrog":
		if body.velocity.y > 0:
			body.velocity.y = -800
		else:
			body.velocity.x = 0
