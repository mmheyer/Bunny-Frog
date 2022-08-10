extends Node2D

export var rotation_speed = 1.1

func _ready():
	$AnimationPlayer.play("rotate")
	
func _process(delta):
	$KinematicBody2D.rotation += rotation_speed * delta
	$KinematicBody2D/pivot/Block1.global_rotation = 0
	$KinematicBody2D/Collision1.global_rotation = 0
	$KinematicBody2D/pivot/Block2.global_rotation = 0
	$KinematicBody2D/Collision2.global_rotation = 0
	$KinematicBody2D/pivot/Block3.global_rotation = 0
	$KinematicBody2D/Collision3.global_rotation = 0
	$KinematicBody2D/pivot/Block4.global_rotation = 0
	$KinematicBody2D/Collision4.global_rotation = 0

func _on_Group_body_entered(body):
	if body.name == "bunnyfrog":
		body.die()
		$AnimationPlayer.stop()
		rotation_speed = 0

func _on_Area2D_body_entered(body):
	if body.name == "bunnyfrog":
		body.velocity == $KinematicBody2D.get_linear_velocity
