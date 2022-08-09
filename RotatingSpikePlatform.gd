extends Area2D

export var rotation_speed = 1.1

func _ready():
	$AnimationPlayer.play("rotate")
	
func _process(delta):
	$KinematicBody2D/Sprite/pivot.rotation += rotation_speed * delta
	$KinematicBody2D/Sprite/pivot/Block1.global_rotation = 0
	$KinematicBody2D/Sprite/pivot/Block2.global_rotation = 0
	$KinematicBody2D/Sprite/pivot/Block3.global_rotation = 0
	$KinematicBody2D/Sprite/pivot/Block4.global_rotation = 0

func _on_Area2D_body_entered(body):
	if body.name == "bunnyfrog":
		body.die()
