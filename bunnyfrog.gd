extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
var speed = 160
var jumpforce = -700
var gravity = 30
var dying = false
var offsets = Vector2(100,100)

func _physics_process(delta):
	if(dying == true):
		speed = 0
		velocity.y = 0
		gravity = 0
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
	if dying == false && not is_on_floor():
		$Sprite.play("air")
	
	velocity.y = velocity.y + gravity
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpforce
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.4)
	
	var collision = move_and_collide(velocity * delta)
	if not is_on_floor() and collision:
		if collision.collider.name == "Water":
			die()
	
func die():
	dying = true
	if not is_on_floor():
		$Sprite.play("air die")
	else:
		$Sprite.play("die")
	yield($Sprite, "animation_finished")
	Transition.fade_to(get_tree().get_current_scene().get_name())
	yield(get_node("/root/Transition/AnimatedSprite"), "animation_finished")
	get_tree().reload_current_scene()
	Transition.fade_from(get_tree().get_current_scene().get_name())

func add_coin():
		coins = coins + 1
