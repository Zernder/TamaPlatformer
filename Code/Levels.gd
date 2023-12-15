extends Node2D

# Objectives and Levels

func LevelOneComplete(_area):
	get_tree().change_scene_to_file(Global.LevelTwo)


func LevelTwoComplete(_area):
	get_tree().change_scene_to_file(Global.MainMenu)


func LevelThreeComplete(_area):
	pass


func Part1Complete(_area):
	$Player.global_position = $part2Start/StartOneTwo.global_position

func Part2Start(_area):
	$Player.global_position = $Spawn.global_position
	


