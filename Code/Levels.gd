extends Global

# Objectives and Levels

func LevelOneComplete(_area):
	get_tree().change_scene_to_file(LevelTwo)


func LevelTwoComplete(_area):
	get_tree().change_scene_to_file(MainMenu)


func LevelThreeComplete(_area):
	pass # Replace with function body.
