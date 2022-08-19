extends Area2D

export var velocity : int = -650

func _on_Spring_body_entered(body):
	if body.name == "bunnyfrog":
		Music.spring()
		body.velocity.y = velocity
