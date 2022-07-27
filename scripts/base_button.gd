extends Button

var level_path : String

func _on_base_button_pressed():
	Transition.fade(level_path)
