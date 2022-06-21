extends Node2D

func _ready():
	var player = get_node("bunnyfrog/Sprite")
	Transition.fade(get_tree().get_current_scene().get_name())
	yield(get_node("/root/Transition/AnimatedSprite"), "animation_finished")
	player.play("revive")
