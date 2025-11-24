extends CanvasLayer

func _ready():
	GameState.crystal_change.connect(crystals)
	print ("ready played")
	$LifeLabel.text = "Lives: " + str(GameState.lives)
	crystals(GameState.num_crystals)


func crystals(new_crystals: int) -> void:
	print ("updated crystals")
	$CoinsLabel.text = "Crystals: " + str(new_crystals)
