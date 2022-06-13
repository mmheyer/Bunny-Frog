extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
const SPEED = 250
const JUMPFORCE = -1000
const GRAVITY = 38

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
	if not is_on_floor():
		$Sprite.play("air")
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.4)

func die ():
	$Sprite.play("die")
	get_tree().change_scene("res://MainGame.tscn")

func add_coin():
		coins = coins + 1
