extends CanvasLayer

@onready var abilityanim = $HBoxContainer/AnimationPlayer
@onready var animtimer = $HBoxContainer/AbilityCooldown

func _physics_process(_delta):
	use()

func use():
	if Input.is_action_just_pressed("Throw"):
		animtimer.start()
		abilityanim.play("Used")


func AbilityCooldown():
	abilityanim.play("New")
