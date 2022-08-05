extends Node2D

func _ready():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Sound Effects"), false)
	if(not Music.is_playing):
		$Timer.wait_time = 0.6
		$Timer.start()
		yield($Timer, "timeout")
		Music.play_music()
