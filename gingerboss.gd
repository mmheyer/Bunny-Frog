extends Area2D

export var speed : int = 100
export var moveDist : int = 100
onready var startX : float = position.x
onready var targetX : float = position.x + moveDist
var start = false

func _ready():
	$AnimatedSprite.play("default")

func _physics_process (delta):
	# move to the "targetX" position
	if start == false:
		if Input.is_action_pressed("jump") || Input.is_action_pressed("left") || Input.is_action_pressed("right"):
			start = true
	else:
		position.x = move_to(position.x, targetX, speed * delta)
			
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
	if(body.name == "bunnyfrog"):
		speed = 0
		body.die()
