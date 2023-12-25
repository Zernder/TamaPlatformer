extends Node2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 300

func arrow():
	pass

func _ready():
	set_as_top_level(true)

func _process(delta):
	position += ((Vector2.RIGHT * speed).rotated(rotation)  + Vector2.DOWN * gravity/50)* delta


func GemMeetsBody(_area):
	pass
	#if !is_in_group("player"):
		#queue_free()
