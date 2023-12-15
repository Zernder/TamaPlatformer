extends Node2D

var answer = true
var Enemies_slain = false
var speed = 0
var PlayerLevelComplete = 0



# menu Buttons
@onready var MainMenu = "res://Scenes/Menu's/MainMenu.tscn"
@onready var LevelSelect = "res://Scenes/Levels/LevelSelection.tscn"

# Platformer Variables
@onready var LevelZero = ""
@onready var LevelOne = "res://Scenes/Levels/Level1.tscn"
@onready var LevelTwo = "res://Scenes/Levels/level2.tscn"
@onready var LevelThree = "res://Scenes/Levels/Level3.tscn"


# WorldMap Settings:
# SprintToggle = 0 means walk
# SprintToggle = 1 walk


func _ready():
	pass
	
func _physics_process(_delta):
	pass
	

