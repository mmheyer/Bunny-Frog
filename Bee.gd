extends Area2D
export var speed = 300

func _on_Area2D_body_entered(body):
	if body.name == "bunnyfrog":
		body.die()
