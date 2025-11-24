extends Node

var num_crystals = 0
var lives = 3
signal crystal_change(new_crystals)
signal life_change(new_lives)
enum PlayerState {BASE, MASKED, SWORDED}
var current_state = PlayerState.BASE

func give_crystal(num: int) -> void:
	num_crystals += num
	emit_signal("crystal_change", num_crystals)
	print ("emitted signal")

func life_lost() -> void:
	lives -= 1
	emit_signal("life_change", lives)
	if lives <= 0:
		get_tree().change_scene_to_file("res://level/fail.tscn")
	else:
		get_tree().reload_current_scene()
