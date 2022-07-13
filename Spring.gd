extends StaticBody2D


func _on_Area2D_body_entered(body):
	if body.name == "bunnyfrog" and body.velocity.y > 0:
		body.velocity.y = -800
