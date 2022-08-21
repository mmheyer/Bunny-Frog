extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
var speed = 160
var jumpforce = -450
var gravity = 18
var dying = false
var offsets = Vector2(100,100)
var facing_r = true
var facing_l = false

func _physics_process(delta):
	
	collision_all()
	collision_normal()
	
	if dying == true :
		speed = 0
		velocity.y = 0
		gravity = 0
	elif velocity.y == -650:
		$Sprite.play("air")
	elif Input.is_action_pressed("jump") and is_on_floor():
		$Sprite.play("air")
		collision_jump()
		Music.jumpsound()
		velocity.y = jumpforce
	elif Input.is_action_pressed("right"):
		facing_r = true
		facing_l = false
		velocity.x = speed
		if is_on_floor():
			$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		facing_r = false
		facing_l = true
		velocity.x = -speed
		if is_on_floor():
			$Sprite.play("walk")
		$Sprite.flip_h = true
	elif is_on_floor():
		$Sprite.play("idle")
	
	velocity.y = velocity.y + gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.4)
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.name == "Spikes":
			die()
		elif not is_on_floor() and collision.collider.name == "Water":
			die()
	
func die():
	pass
#	dying = true
#	if not is_on_floor():
#		$Sprite.play("air die")
#	else:
#		$Sprite.play("die")
#	yield($Sprite, "animation_finished")
#	Transition.fade2()

func add_coin():
	coins = coins + 1

func collision_all():
	var coll_normal := get_node(str("normal")) as CollisionPolygon2D
	var coll_jump := get_node(str("jump")) as CollisionPolygon2D
	var coll_jump2 := get_node(str("jump2")) as CollisionPolygon2D
	var coll_jump3 := get_node(str("jump3")) as CollisionPolygon2D
	coll_normal.disabled = true
	coll_jump.disabled = true
	coll_jump2.disabled = true
	coll_jump3.disabled = true

func collision_normal():
	var coll_normal := get_node(str("normal")) as CollisionPolygon2D
	if facing_l:
		coll_normal.scale.x = -1
	elif facing_r:
		coll_normal.scale.x = 1
	coll_normal.disabled = false
	
	
func collision_jump():
	var sprite:AnimatedSprite = $Sprite
	var coll_jump := get_node(str("jump")) as CollisionPolygon2D
	var coll_jump2 := get_node(str("jump2")) as CollisionPolygon2D
	var coll_jump3 := get_node(str("jump3")) as CollisionPolygon2D
	if facing_l:
		coll_jump.scale.x = -1
		coll_jump2.scale.x = -1
		coll_jump3.scale.x = -1
	elif facing_r:
		coll_jump.scale.x = 1
		coll_jump2.scale.x = 1
		coll_jump3.scale.x = 1
	if sprite.frame == 0:
		coll_jump.disabled = false
		coll_jump2.disabled = true
		coll_jump3.disabled = true
	elif sprite.frame == 1 || sprite.frame == 2:
		coll_jump.disabled = true
		coll_jump2.disabled = false
		coll_jump3.disabled = true
	else:
		coll_jump.disabled = true
		coll_jump2.disabled = true
		coll_jump3.disabled = false

