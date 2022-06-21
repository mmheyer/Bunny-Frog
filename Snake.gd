extends Area2D

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	var sprite:AnimatedSprite = $Snake
	$Snake.play("default")
	var collision1 := get_node(str("Coll0")) as CollisionPolygon2D
	var collision2 := get_node(str("Coll1")) as CollisionPolygon2D
	if sprite.frame == 9 || sprite.frame == 10 || sprite.frame == 11:
		collision1.disabled = true
		collision2.disabled = false
	else:
		collision1.disabled = false
		collision2.disabled = true


func _on_Area2D_body_entered(body):
	if body.name == "bunnyfrog":
		body.die()
