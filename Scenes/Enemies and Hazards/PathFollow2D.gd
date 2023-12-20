extends PathFollow2D

@onready var speed = 0.1

func _process(delta):
	progress_ratio += delta * speed
