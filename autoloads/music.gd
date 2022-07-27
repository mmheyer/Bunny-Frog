extends Node2D

var world1 = load("res://ASSETS/bgm/Komiku - Poupi Great Adventures _ The Arcade Game.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func play_music():
	$Music.stream = world1
	$Music.play()
