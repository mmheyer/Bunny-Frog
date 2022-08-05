extends Node2D

var world1 = load("res://ASSETS/bgm/Komiku - Poupi Great Adventures _ The Arcade Game.mp3")
var coin = load("res://ASSETS/sound effects/coin collect sound.wav")
var springj = load("res://ASSETS/sound effects/springjump.wav")
var key = load("res://ASSETS/sound effects/key collect sound.wav")
var jump = load("res://ASSETS/sound effects/jump.wav")
var breaksound = load("res://ASSETS/sound effects/breaking.wav")
var christmas = load("res://ASSETS/bgm/christmas cutscene.mp3")
var is_playing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func stop():
	$Music.stop()
	is_playing = false

func play_music():
	$Music.stream = world1
	$Music.volume_db = 0
	$Music.play()
	is_playing = true
	
func play_ch():
	$Music.stream = christmas
	$Music.volume_db = -5
	$Music.play()

func coin_collect():
	$Sounds.stream = coin
	$Sounds.volume_db = 0
	$Sounds.play()

func spring():
	$Jumps.stream = springj
	$Jumps.volume_db = 0
	$Jumps.play()

func keysound():
	$Sounds.stream = key
	$Sounds.volume_db = 0
	$Sounds.play()

func jumpsound():
	$Jumps.stream = jump
	$Jumps.volume_db = -5
	$Jumps.play()

func breaking():
	$Sounds2.stream = breaksound
	$Sounds2.volume_db = 0
	$Sounds2.play()
