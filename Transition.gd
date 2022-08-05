extends CanvasLayer

func fade_to(_scn_path):
	get_node("AnimatedSprite").play("fade1")

func fade_from(_scn_path):
	get_node("AnimatedSprite").play("fade2")
	
func fade(scn):
	fade_to(get_tree().get_current_scene().get_name())
	AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), true)
	$AudioStreamPlayer.play()
	yield(get_node("AnimatedSprite"), "animation_finished")
	assert(get_tree().change_scene(scn)==OK)
	fade_from(get_tree().get_current_scene().get_name())
	AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), false)

func fade2():
	fade_to(get_tree().get_current_scene().get_name())
	AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), true)
	Music.stop()
	$AudioStreamPlayer.play()
	yield(get_node("AnimatedSprite"), "animation_finished")
	assert(get_tree().reload_current_scene()==OK)
	fade_from(get_tree().get_current_scene().get_name())
	AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), false)

func fade_soundcont(scn):
	fade_to(get_tree().get_current_scene().get_name())
	yield(get_node("AnimatedSprite"), "animation_finished")
	assert(get_tree().change_scene(scn)==OK)
	fade_from(get_tree().get_current_scene().get_name())
