extends Area2D

func _ready():
	$AnimationPlayer.play("rotate")

func _on_Area2D_body_entered(body):
	if body.name == "bunnyfrog":
		body.die()
