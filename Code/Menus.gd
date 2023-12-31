extends CanvasLayer

func _ready():
	Android()

# OS Controls
func Android():
	if OS.get_name() == "Android":
		show()

# Main Menu
func Start():
	get_tree().change_scene_to_file(Global.LevelOne)

func LevelSelect():
	get_tree().change_scene_to_file(Global.LevelSelect)

func ExitGame():
	get_tree().quit()

# Levels

@onready var pos = Vector2.ZERO

func LevelOne():
	get_tree().change_scene_to_file(Global.LevelOne)


func LevelTwo():
	get_tree().change_scene_to_file(Global.LevelTwo)


func LevelThree():
	get_tree().change_scene_to_file(Global.LevelThree)
