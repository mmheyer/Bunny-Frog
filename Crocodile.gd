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
	if sprite.frame == 0:
		collision5.disabled = true
		collision0.disabled = false
	elif sprite.frame == 1:
		collision0.disabled = true
		collision1.disabled = false
	elif sprite.frame == 2 || sprite.frame == 3 || sprite.frame == 5 || sprite.frame == 6:
		collision1.disabled = true
		collision3.disabled = true
		collision2.disabled = false
	elif sprite.frame == 4:
		collision2.disabled = true
		collision3.disabled = false
	elif sprite.frame == 7 || sprite.frame == 8 || sprite.frame == 9:
		collision3.disabled = true
		collision4.disabled = false
	elif sprite.frame == 10:
		collision4.disabled = true
		collision5.disabled = false
	else:
		collision0.disabled = true
		collision1.disabled = true
		collision2.disabled = true
		collision3.disabled = true
		collision4.disabled = true
		collision5.disabled = true

func _on_Area2D_body_entered(body):
	if body.name == "bunnyfrog":
		body.die()
