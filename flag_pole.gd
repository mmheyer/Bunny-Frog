extends Area2D

onready var animatedSprite = $AnimatedSprite

func _physics_process(_delta):
	animatedSprite.animation = "idle"

func _on_flag_pole_body_entered(body):
	animatedSprite.animation = "sparks"
