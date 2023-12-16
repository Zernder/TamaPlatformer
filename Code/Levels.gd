extends Node2D

# Objectives and Levels

func LevelOneComplete(_area):
	get_tree().change_scene_to_file(Global.LevelTwo)


func LevelTwoComplete(_area):
	get_tree().change_scene_to_file(Global.LevelThree)


func LevelThreeComplete(_area):
	get_tree().change_scene_to_file(Global.MainMenu)


func Part1(_area):
	$Player.global_position = $part2/parttwo.global_position


func part2(_area):
	$Player.global_position = $part1/partone.global_position
