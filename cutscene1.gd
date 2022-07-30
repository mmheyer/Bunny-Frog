extends Area2D

var text_speed = 0.08
var anim1_done = false
var anim2_done = false
var anim3_done = false
onready var sc1 = get_node("SantaDialogue1")
onready var eb1 = get_node("BunnyDialogue1")
onready var f1 = get_node("FrogDialogue1")
onready var type = get_node("TypeAudio")
onready var bgm1 = get_node("BGM1")
onready var sur = get_node("Surprise")

func _process(_delta):
	if anim1_done and Input.is_action_just_released("ui_accept"):
		sc1.percent_visible = 0
		$AnimatedSprite.play("bunny1")
		anim1_done = false
		yield(get_tree().create_timer(0.5), "timeout")
		while eb1.percent_visible < 1:
			type.play()
			eb1.percent_visible += 1.0/eb1.text.length()/1
			yield(get_tree().create_timer(text_speed), "timeout")
		if(eb1.percent_visible == 1):
			$AnimatedSprite.play("bunny1.1")
			anim2_done = true
	elif anim2_done and Input.is_action_just_released("ui_accept"):
		eb1.percent_visible = 0
		anim2_done = false
		$AnimatedSprite.play("scene2")
		Music.play_ch()
		yield($AnimatedSprite, "animation_finished")
		$AnimatedSprite.play("frog1")
		yield(get_tree().create_timer(0.5), "timeout")
		var count = 0
		while f1.percent_visible < 1:
			if count%2 == 0:
				type.play()
			f1.percent_visible += 1.0/f1.text.length()/1
			yield(get_tree().create_timer(0.3), "timeout")
			count = count+1
		if(f1.percent_visible == 1):
			$AnimatedSprite.play("frog1.1")
			anim3_done = true
	elif anim3_done and Input.is_action_just_released("ui_accept"):
		f1.percent_visible = 0
		anim3_done = false
		$AnimatedSprite.play("scene3")

func _ready():
	sc1.percent_visible = 0
	eb1.percent_visible = 0
	f1.percent_visible = 0
	bgm1.play()
	$AnimatedSprite.play("default")
	yield(get_tree().create_timer(2), "timeout")
	$AnimatedSprite.play("scene1")
	yield(get_tree().create_timer(2.42), "timeout")
	bgm1.stop()
	sur.play()
	yield($AnimatedSprite, "animation_finished")
	$AnimatedSprite.play("santa1")
	yield(get_tree().create_timer(0.5), "timeout")
	while sc1.percent_visible < 1:
		type.play()
		sc1.percent_visible += 1.0/sc1.text.length()/1
		yield(get_tree().create_timer(text_speed), "timeout")
	if(sc1.percent_visible == 1):
		$AnimatedSprite.play("santa1.1")
		anim1_done = true
