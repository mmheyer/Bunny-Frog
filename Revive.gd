extends Button

func _on_Revive_pressed():
	Transition.fade_to(get_tree().get_current_scene().get_name())
	yield(get_node("/root/Transition/AnimatedSprite"), "animation_finished")
	get_tree().change_scene("res://MainGame.tscn")
