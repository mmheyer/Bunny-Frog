extends CanvasLayer

func fade_to(scn_path):
	get_node("AnimatedSprite").play("fade1")

func fade_from(scn_path):
	get_node("AnimatedSprite").play("fade2")
	
func fade(scn):
	fade_to(get_tree().get_current_scene().get_name())
	yield(get_node("AnimatedSprite"), "animation_finished")
	get_tree().change_scene(scn)
	fade_from(get_tree().get_current_scene().get_name())
