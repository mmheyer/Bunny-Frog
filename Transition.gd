extends CanvasLayer

func fade_to(scn_path):
	get_node("AnimatedSprite").play("fade1")

func fade(scn_path):
	get_node("AnimatedSprite").play("fade2")
