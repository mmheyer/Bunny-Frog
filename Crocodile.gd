extends Area2D

func _process(_delta):
	var sprite:AnimatedSprite = $Crocodile
	$Crocodile.play("default")
	var collision0 := get_node(str("Coll0")) as CollisionPolygon2D
	var collision1 := get_node(str("Coll1")) as CollisionPolygon2D
	var collision2 := get_node(str("Coll2")) as CollisionPolygon2D
	var collision3 := get_node(str("Coll3")) as CollisionPolygon2D
	var collision4 := get_node(str("Coll4")) as CollisionPolygon2D
	var collision5 := get_node(str("Coll5")) as CollisionPolygon2D
	var collision6 := get_node(str("Coll6")) as CollisionPolygon2D
	if sprite.frame == 0:
		collision5.disabled = true
		collision1.disabled = true
		collision2.disabled = true
		collision3.disabled = true
		collision4.disabled = true
		collision0.disabled = false
	elif sprite.frame == 1:
		collision0.disabled = true
		collision1.disabled = false
	elif sprite.frame == 2 || sprite.frame == 3:
		collision1.disabled = true
		collision2.disabled = false
	elif sprite.frame == 4:
		collision2.disabled = true
		collision3.disabled = false
	elif sprite.frame == 5:
		collision3.disabled = true
		collision4.disabled = false
	elif sprite.frame == 6 || sprite.frame == 7 || sprite.frame == 8:
		collision4.disabled = true
		collision5.disabled = false
	elif sprite.frame == 9:
		collision5.disabled = true
		collision6.disabled = false
	else:
		collision0.disabled = true
		collision1.disabled = true
		collision2.disabled = true
		collision3.disabled = true
		collision4.disabled = true
		collision5.disabled = true
		collision6.disabled = true

func _on_Area2D_body_entered(body):
	if body.name == "bunnyfrog":
		body.die()
