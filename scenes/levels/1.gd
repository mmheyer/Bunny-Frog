extends Node2D

func _ready():
	var player = get_node("bunnyfrog/Sprite")
	AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), false)
	yield(get_tree().create_timer(0.6), "timeout")
	Music.play_music()
