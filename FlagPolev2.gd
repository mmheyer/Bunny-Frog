extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text" 
signal next_level
onready var flag_pole = get_node("AnimatedSprite")

# Called when the node enters the scene tree for the first time.
func _ready():
	flag_pole.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_FlagPolev2_body_entered(body):
	if body.name == "bunnyfrog":
		body.velocity.x = 0
		flag_pole.play("default")
		yield(flag_pole, "animation_finished")
		emit_signal("next_level")
