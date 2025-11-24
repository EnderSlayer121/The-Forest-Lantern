extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print ("body is in group executed")
		GameState.give_crystal(1)
		queue_free()
