extends Node2D



func _on_scene_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print ("body is in group executed")
		if GameState.num_crystals < 2:
			get_tree().change_scene_to_file("res://screen2.tscn")
		else:
			get_tree().change_scene_to_file("res://screen2alt1.tscn")
