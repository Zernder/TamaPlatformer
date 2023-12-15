extends Node2D

var speed: float = 100
var target: Marker2D
var markers: Array
var start_pos: Vector2 = Vector2()
var velocity: Vector2 = Vector2()
var current_marker_index = 0

func _ready():
	start_pos = position
	markers = [get_node("A"), get_node("B")]
	# Set the initial target
	target = markers[0]

	# Debugging: Print initial positions
	print("Initial Enemy Position: ", position)
	print("Marker A Position: ", markers[0].global_position)
	print("Marker B Position: ", markers[1].global_position)

func get_target_position():
	return start_pos + target.position

func _process(delta):
	# Calculate the direction towards the current target
	var direction = (get_target_position() - position).normalized()
	velocity = direction * speed

	# Move the enemy
	position += velocity * delta

	# Check if the enemy has reached the target
	if position.distance_to(get_target_position()) < 10:
		current_marker_index = 1 - current_marker_index
		target = markers[current_marker_index]
