extends Node2D


func _on_scene_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print ("body is in group executed")
		if GameState.num_crystals == 0:
			get_tree().change_scene_to_file("res://screen1alt1.tscn")
		elif GameState.num_crystals >= 3:
			GameState.reset_lives()
			GameState.reset_crystals()
			get_tree().change_scene_to_file("res://succeed.tscn")
		else:
			get_tree().change_scene_to_file("res://screen1alt2.tscn")



func _on_scene_detection_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print ("body is in group executed")
		if GameState.num_crystals != 3:
			get_tree().change_scene_to_file("res://screen3.tscn")
		else:
			get_tree().change_scene_to_file("res://screen3alt1.tscn")
