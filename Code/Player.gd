extends CharacterBody2D

@onready var Spawn = $"../Spawn"
@onready var anim = $AnimatedSprite2D
@onready var player = $"."
@onready var timer = $HitBox/Timer
@onready var StoneDestination = $StoneThrow
@onready var PortalStone = preload("res://Scenes/Objects/PortalStone.tscn")

var Strawberry = 0
var death = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	anim.play("idle")
	timer.wait_time = 3.0
	timer.one_shot = true


# Movement and Animation Code
func _physics_process(delta):
	jump(delta)
	Movement()
	Sprint()
	Pause()
	throwGem(delta)
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
	

var jump_velocity = -350.0
var double_jump_velocity = -400.0
var has_double_jumped : bool = false

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
	Global.speed = 250
	jump_velocity = -350

func CollectionBubble(area):
	if area is Strawberry_Class:
		Strawberry += 1
		area.queue_free()
	#get_node("GUI/StrawberryCounter/StrawberryLabel").text = str(Strawberry)

func HitBox(area):
	if area.is_in_group("Hazards"):
		hide()
		player.global_position = Spawn.global_position
		show()

func throwGem(_delta):
	var mouse_pos = get_global_mouse_position()
	StoneDestination.look_at(mouse_pos)
	
	if Input.is_action_just_pressed("Throw"):
		print("Pew")
		var PortalInstance = PortalStone.instantiate()
		PortalInstance.rotation = StoneDestination.rotation
		PortalInstance.global_position = StoneDestination.global_position
		add_child(PortalInstance)
		await get_tree().create_timer(1).timeout
