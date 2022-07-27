extends Button

var level_path : String

func _on_LevelBox_pressed():
	Transition.fade(level_path)
