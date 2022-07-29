extends Area2D

func _ready():
	$AnimatedSprite.play("default")

func _on_block_body_entered(body):
	var coll0 := get_node(str("StaticBody2D/Coll0")) as CollisionPolygon2D
	var coll1 := get_node(str("Coll1")) as CollisionPolygon2D
	if(body.name == "bunnyfrog"):
		yield(get_tree().create_timer(0.6), "timeout")
		$AnimatedSprite.play("break")
		Music.breaking()
		yield($AnimatedSprite, "animation_finished")
		$AnimatedSprite.visible = not $AnimatedSprite.visible
		coll0.disabled = true
		coll1.disabled = true
		yield(get_tree().create_timer(2), "timeout")
		$AnimatedSprite.visible = not $AnimatedSprite.visible
		coll0.disabled = false
		coll1.disabled = false
		$AnimatedSprite.play("revive")
		yield($AnimatedSprite, "animation_finished")
		$AnimatedSprite.play("default")
