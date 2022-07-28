extends Control

func _ready():
	$SettingsButton.get_popup().add_item("Music")
	$AudioStreamPlayer.play()
