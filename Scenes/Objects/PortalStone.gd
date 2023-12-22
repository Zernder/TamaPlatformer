extends Node2D


@onready var abilityanim = $AnimationPlayer
@onready var animtimer = $AbilityCooldown
	

func _process(_delta):
	use()


func use():
	if Input.is_action_just_pressed("Use"):
		abilityanim.play("Used")
		animtimer.start()
		

func AbilityCooldown():
	abilityanim.play("New")
