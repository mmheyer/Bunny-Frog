extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed : int = 100
export var moveDist : int = 100
onready var startY : float = position.y
onready var targetY : float = position.y + moveDist


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process (delta):
	# move to the "targetX" position
	position.y = move_to(position.y, targetY, speed * delta)
	# if we're at our target, move in the other direction
	if position.y == targetY:
		if targetY == startY:
			targetY = position.y + moveDist
		else:
			targetY = startY
			
# moves "current" towards "to" in an increment of "step"
func move_to (current, to, step):
	var new = current
	# are we moving positive?
	if new < to:
		new += step
		if new > to:
			new = to
	# are we moving negative?
	else:
		new -= step
		if new < to:
			new = to
	return new
	
func _on_Area2D_body_entered(body):
	if body.name == "bunnyfrog":
		body.die()
