extends Area2D

class_name Cherries_Class

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("Idle")

