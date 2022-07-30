extends Area2D

var text_speed = 0.08
var anim0_done = false
var anim1_done = false
var anim2_done = false
var anim3_done = false
var anim4_done = false
onready var sc1 = get_node("SantaDialogue1")
onready var eb1 = get_node("BunnyDialogue1")
onready var f1 = get_node("FrogDialogue1")
onready var f2 = get_node("FrogDialogue2")
onready var f3 = get_node("FrogDialogue3")
onready var type = get_node("TypeAudio")
onready var bgm1 = get_node("BGM1")
onready var sur = get_node("Surprise")

func _process(_delta):
	if(anim0_done and Input.is_action_just_released("ui_accept")):
		f1.percent_visible = 0
		anim0_done = false
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
	elif anim1_done and Input.is_action_just_released("ui_accept"):
		sc1.percent_visible = 0
		$AnimatedSprite.play("bunny1")
		anim1_done = false
		yield(get_tree().create_timer(0.5), "timeout")
		var eb1str = eb1.get_bbcode()
		while eb1.percent_visible < 1:
			type.play()
			eb1.percent_visible += 1.0/eb1.text.length()/1
			if(eb1.visible_characters > 2):
				if(eb1str.ord_at(eb1.visible_characters - 1) == 46):
					yield(get_tree().create_timer(0.3), "timeout")
				elif(eb1str.ord_at(eb1.visible_characters - 1) == 63):
					yield(get_tree().create_timer(0.5), "timeout")
				else:
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
		$AnimatedSprite.play("frog2")
		yield(get_tree().create_timer(0.5), "timeout")
		var count = 0
		while f2.percent_visible < 1:
			if count%2 == 0:
				type.play()
			f2.percent_visible += 1.0/f2.text.length()/1
			yield(get_tree().create_timer(0.3), "timeout")
			count = count+1
		if(f2.percent_visible == 1):
			$AnimatedSprite.play("frog2.1")
			anim3_done = true
	elif anim3_done and Input.is_action_just_released("ui_accept"):
		f2.percent_visible = 0
		anim3_done = false
		$AnimatedSprite.play("frog2")
		yield(get_tree().create_timer(0.5), "timeout")
		while f3.percent_visible < 1:
			type.play()
			f3.percent_visible += 1.0/f3.text.length()/1
			yield(get_tree().create_timer(text_speed), "timeout")
		if(f3.percent_visible == 1):
			$AnimatedSprite.play("frog2.1")
			anim4_done = true
	elif anim4_done and Input.is_action_just_released("ui_accept"):
		f3.percent_visible = 0
		anim4_done = false
		$AnimatedSprite.play("scene3")

func _ready():
	sc1.percent_visible = 0
	eb1.percent_visible = 0
	f1.percent_visible = 0
	f2.percent_visible = 0
	f3.percent_visible = 0
	bgm1.play()
	$AnimatedSprite.play("default")
	yield(get_tree().create_timer(1), "timeout")
	$AnimatedSprite.play("frog1")
	yield(get_tree().create_timer(0.5), "timeout")
	var f1str = f1.get_bbcode()
	while f1.percent_visible < 1:
		type.play()
		f1.percent_visible += 1.0/f1.text.length()/1
		if(f1.visible_characters > 2):
			if(f1str.ord_at(f1.visible_characters - 1) == 46 and f1str.ord_at(f1.visible_characters - 2) == 101) || (f1str.ord_at(f1.visible_characters - 1) == 45):
				yield(get_tree().create_timer(0.4), "timeout")
		yield(get_tree().create_timer(text_speed), "timeout")
	if(f1.percent_visible == 1):
		$AnimatedSprite.play("frog1.1")
		anim0_done = true
