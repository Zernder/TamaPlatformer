extends Area2D

class_name Strawberry_Class

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("Idle")

