extends PathFollow2D

export var flyspeed = 300

func _process(delta):
	set_offset(get_offset() + flyspeed * delta)
