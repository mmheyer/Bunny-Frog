extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
var speed = 250
const JUMPFORCE = -1000
const GRAVITY = 38
var dying = false
var offsets = Vector2(100,100)

func _physics_process(delta):
	if(dying == true):
		speed = 0
	elif Input.is_action_pressed("right"):
		velocity.x = speed
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
		$Sprite.play("walk")
		$Sprite.flip_h = true
	elif dying == false:
		$Sprite.play("idle")
	if not is_on_floor():
		$Sprite.play("air")
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.4)
	
func die():
	dying = true
	$Sprite.play("die")
	yield($Sprite, "animation_finished")
	queue_free()
	Transition.fade_to(get_tree().get_current_scene().get_name())
	get_tree().reload_current_scene()
	Transition.fade(get_tree().get_current_scene().get_name())

func add_coin():
		coins = coins + 1
