extends Node2D

var world1 = load("res://ASSETS/bgm/Komiku - Poupi Great Adventures _ The Arcade Game.mp3")
var coin = load("res://ASSETS/sound effects/coin collect sound.wav")
var springj = load("res://ASSETS/sound effects/springjump.wav")
var key = load("res://ASSETS/sound effects/key collect sound.wav")
var jump = load("res://ASSETS/sound effects/jump.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func stop():
	$Music.stop()

func play_music():
	$Music.stream = world1
	$Music.play()

func coin_collect():
	$Sounds.stream = coin
	$Sounds.volume_db = 0
	$Sounds.play()

func spring():
	$Sounds.stream = springj
	$Sounds.volume_db = 0
	$Sounds.play()

func keysound():
	$Sounds.stream = key
	$Sounds.volume_db = 0
	$Sounds.play()

func jumpsound():
	$Sounds.stream = jump
	$Sounds.volume_db = -5
	$Sounds.play()
