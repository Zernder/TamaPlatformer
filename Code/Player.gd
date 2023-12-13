extends CharacterBody2D

@onready var Respawn = $"../RespawnPoint"
@onready var anim = $AnimatedSprite2D
@onready var timer = $CollectionBubble/Timer

var jump_velocity = -350.0
var double_jump_velocity = -400.0
var has_double_jumped : bool = false
var Strawberry = 0
var death = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	anim.play("idle")
	timer.wait_time = 3.0
	timer.one_shot = true



func _physics_process(delta):
	jump(delta)
	Movement()
	Sprint()
	Pause()
	move_and_slide()

func Movement():
	var direction = Input.get_axis("left", "right")
	
	if Input.is_action_pressed("left"):
		anim.play("walkleft")
		velocity.x = direction * Global.speed
	elif Input.is_action_pressed("right"):
		anim.play("walkright")
		velocity.x = direction * Global.speed
	else:
		anim.play("idle")
		velocity.x = move_toward(velocity.x, 0, Global.speed)

func Sprint():
	if Input.is_action_pressed("Sprint"):
		Global.speed = 200
	else:
		Global.speed = 150
	
	
func jump(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		has_double_jumped = false

	# Handle jump.
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor():
			velocity.y = jump_velocity
		elif not has_double_jumped:
			velocity.y = double_jump_velocity
			has_double_jumped = true


func Pause():
	if Input.is_action_pressed("Pause"):
		get_tree().paused = true


func RespawnTimer():
	show()
	# Reset any necessary player states (health, inventory, etc.)
	Global.speed = 250
	jump_velocity = -350


func CollectionBubble(area):
	if area is Strawberry_Class:
		Strawberry += 1
		area.queue_free()
	get_node("HBoxContainer/StrawberryCounter").text = str(Strawberry)
	
	if area.is_in_group("Hazards"):
		Global.speed = 0
		jump_velocity = 0
		timer.start()
		hide()
		position = Respawn.position
