extends CharacterBody2D

const speed = 4000

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction:
		velocity = direction * speed * delta
	else:
		velocity.x = move_toward(velocity.x, 0, speed * delta)
		velocity.y = move_toward(velocity.y, 0, speed * delta)
	
	if velocity != Vector2.ZERO:
		play_movement_animation(velocity)
	
	move_and_slide()

func play_movement_animation(velocity: Vector2):
	#left v right
	if velocity.x > 0:
		$AnimatedSprite2D.play("right")
	elif velocity.x < 0:
		$AnimatedSprite2D.play("left")
	#up v down
	if velocity.y > 0:
		$AnimatedSprite2D.play("front")
	elif velocity.y < 0:
		$AnimatedSprite2D.play("back")
