extends Control

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_ResumeButton_pressed():
	self.is_paused = false

func _on_RestartButton_pressed():
	self.is_paused = false
	Music.stop()
	Transition.fade2()

func _on_QuitButton_pressed():
	self.is_paused = false
	Transition.fade("res://TitleMenu.tscn")
	Music.stop()
	AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), false)


func _on_Button_pressed():
	self.is_paused = !is_paused
