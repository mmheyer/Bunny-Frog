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
	
	if $Sprite.get_animation() == "idle" || $Sprite.get_animation() == "walk":
		if facing_r:
			collision_normal()
		elif facing_l:
			collision_flip()
	elif $Sprite.get_animation() == "jump":
		if facing_r:
			collision_jump()
		elif facing_l:
			collision_jump_flip()
	
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
	dying = true
	if not is_on_floor():
		$Sprite.play("air die")
	else:
		$Sprite.play("die")
	yield($Sprite, "animation_finished")
	Transition.fade2()

func add_coin():
	coins = coins + 1

func collision_all():
	var coll_normal := get_node(str("normal")) as CollisionPolygon2D
	var coll_flip := get_node(str("flip")) as CollisionPolygon2D
	var coll_jump := get_node(str("jump")) as CollisionPolygon2D
	var coll_jump2 := get_node(str("jump2")) as CollisionPolygon2D
	var coll_jump3 := get_node(str("jump3")) as CollisionPolygon2D
	var coll_jumpflip := get_node(str("jumpflip")) as CollisionPolygon2D
	var coll_jumpflip2 := get_node(str("jumpflip2")) as CollisionPolygon2D
	var coll_jumpflip3 := get_node(str("jumpflip3")) as CollisionPolygon2D
	coll_normal.disabled = true
	coll_flip.disabled = true
	coll_jump.disabled = true
	coll_jump2.disabled = true
	coll_jump3.disabled = true
	coll_jumpflip.disabled = true
	coll_jumpflip2.disabled = true
	coll_jumpflip3.disabled = true

func collision_normal():
	var coll_normal := get_node(str("normal")) as CollisionPolygon2D
	coll_normal.disabled = false
	
func collision_jump():
	var sprite:AnimatedSprite = $bunnyfrog
	var coll_jump := get_node(str("jump")) as CollisionPolygon2D
	var coll_jump2 := get_node(str("jump2")) as CollisionPolygon2D
	var coll_jump3 := get_node(str("jump3")) as CollisionPolygon2D
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

func collision_flip():
	var coll_flip := get_node(str("flip")) as CollisionPolygon2D
	coll_flip.disabled = false

func collision_jump_flip():
	var sprite:AnimatedSprite = $bunnyfrog
	var coll_jumpf := get_node(str("jumpflip")) as CollisionPolygon2D
	var coll_jumpf2 := get_node(str("jumpflip2")) as CollisionPolygon2D
	var coll_jumpf3 := get_node(str("jumpflip3")) as CollisionPolygon2D
	if sprite.frame == 0:
		coll_jumpf.disabled = false
		coll_jumpf2.disabled = true
		coll_jumpf3.disabled = true
	elif sprite.frame == 1 || sprite.frame == 2:
		coll_jumpf.disabled = true
		coll_jumpf2.disabled = false
		coll_jumpf3.disabled = true
	else:
		coll_jumpf.disabled = true
		coll_jumpf2.disabled = true
		coll_jumpf3.disabled = false
