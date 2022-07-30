extends CanvasLayer

var collected = false
onready var keyimg = get_node("KeyImg")

func _ready():
	keyimg.visible = false

func _on_key_key_collected():
	keyimg.visible = true
