extends Control

func _ready():
	$SettingsButton.get_popup().add_item("Music")
	AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), false)
	yield(get_tree().create_timer(0.5), "timeout")
	$AudioStreamPlayer.play()
