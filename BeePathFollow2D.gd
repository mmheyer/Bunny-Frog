extends PathFollow2D

export var speed = 300

func _process(delta):
	set_offset(get_offset() + speed * delta)


func _on_Area2D_body_entered(body):
	if body.name == "bunnyfrog":
		speed = 0
