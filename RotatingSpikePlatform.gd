extends Node2D

export var rotation_speed = 1.1
var speed = 0

func _ready():
	$AnimationPlayer.play("rotate")
	
func _process(delta):
	$KinematicBody2D.rotation += rotation_speed * delta
	speed = rotation_speed * delta
	$KinematicBody2D/pivot/Block1.global_rotation = 0
	$KinematicBody2D/Collision1.global_rotation = 0
	$KinematicBody2D/pivot/Block2.global_rotation = 0
	$KinematicBody2D/Collision2.global_rotation = 0
	$KinematicBody2D/pivot/Block3.global_rotation = 0
	$KinematicBody2D/Collision3.global_rotation = 0
	$KinematicBody2D/pivot/Block4.global_rotation = 0
	$KinematicBody2D/Collision4.global_rotation = 0



#func _on_Blocks_body_entered(body):
#	if body.name == "bunnyfrog":
#		body.velocity.x = speed
#		body.velocity.y = speed
