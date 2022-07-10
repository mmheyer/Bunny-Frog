extends Area2D

onready var animatedSprite = $AnimatedSprite

func _physics_process(delta):
	animatedSprite.animation = "idle"

func _on_flag_pole_body_entered(body):
	animatedSprite.animation = "sparks"
