extends CanvasLayer

var path = ""

func fade_to(scn_path):
	self.path = scn_path # store the scene path
	get_node("AnimatedSprite").play("fade1") # play the transition animation

func fade(scn_path):
	get_node("AnimatedSprite").play("fade2")
