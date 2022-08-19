extends Control

export (PackedScene) var base_button
export (int) var total_levels = 0
export (NodePath) var grid

func _ready():
	print("level select")
	$AudioStreamPlayer.stop()
	AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), false)
	yield(get_tree().create_timer(0.5), "timeout")
	$AudioStreamPlayer.play()
	Music.stop()
	grid = get_node(grid)
	
	if !total_levels <= 4:
		column_size()
		
	for i in range(0, total_levels):
		generate_buttons(i + 1)
		
func generate_buttons(name : int):
	var bb = base_button.instance()
	bb.set_name(str(name))
	bb.set_text(str(name))
	bb.level_path = ("res://scenes/levels/" + str(name) + ".tscn")
	grid.add_child(bb)
	
func column_size():
	if total_levels % 2 == 0:
		grid.columns - total_levels/2
	else:
		grid.columns = total_levels/2 + 1

func _on_back_button_pressed():
	Transition.fade("res://TitleMenu.tscn")
