extends Node2D

func _ready():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), false)
	if(not Music.is_playing):
		$Timer.wait_time = 0.6
		$Timer.start()
		yield($Timer, "timeout")
		Music.play_music()

func _on_FlagPolev2_next_level6():
	Transition.fade("res://scenes/levels/LevelSelect.tscn")
