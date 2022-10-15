extends Node2D

func _ready():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Sound Effects"), false)
	if(not Music.is_playing):
		$Timer.wait_time = 0.6
		$Timer.start()
		yield($Timer, "timeout")
		Music.play_music()


func _on_FlagPolev2_next_level():
	Transition.fade_soundcont("res://scenes/levels/4.tscn")
