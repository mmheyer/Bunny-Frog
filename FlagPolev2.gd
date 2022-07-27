extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var flag_pole = get_node("AnimatedSprite")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_FlagPolev2_body_entered(body):
	body.velocity.x = 0
	flag_pole.play("default")
	yield(flag_pole, "animation_finished")
	get_tree().change_scene("res://scenes/levels/LevelSelect.tscn")
