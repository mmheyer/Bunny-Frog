extends Area2D

func _ready():
	$AnimatedSprite.play("default")

func _on_Area2D_body_entered(body):
	var coll := get_node(str("CollisionShape2D")) as CollisionShape2D
	if(body.name == "bunnyfrog"):
		body.velocity.y = -450
		$AnimatedSprite.play("pop")
		$AudioStreamPlayer.play()
		yield($AnimatedSprite, "animation_finished")
		$AnimatedSprite.play("gone")
		coll.disabled = true
		yield(get_tree().create_timer(1.5), "timeout")
		$AnimatedSprite.play("grow")
		yield($AnimatedSprite, "animation_finished")
		coll.disabled = false
		$AnimatedSprite.play("default")
