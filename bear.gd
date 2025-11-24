extends CharacterBody2D

@export var speed: float = 100.0
@export var patrol_path: Array[Marker2D] = []
@export var patrol_wait_time: float = 1.0

var last_direction: Vector2 = Vector2.ZERO
var current_patrol_target = 0
var wait_timer = 0.0

func _physics_process(delta: float) -> void:
	if patrol_path.size() > 1:
		move_along_path(delta)

func move_along_path(delta: float) -> void:
	var target_position = patrol_path[current_patrol_target].global_position
	var direction = (target_position - position).normalized()
	var distance_to_target = position.distance_to(target_position)

	# Move if not close enough
	if distance_to_target > speed * delta:
		play_movement_animation(direction)
		velocity = direction * speed        # ✔ FIXED
		move_and_slide()
	else:
		position = target_position
		wait_timer += delta

	if wait_timer >= patrol_wait_time:
		wait_timer = 0.0
		current_patrol_target = (current_patrol_target + 1) % patrol_path.size()

func play_movement_animation(direction: Vector2) -> void:
	if direction.distance_squared_to(last_direction) < 0.01:
		return

	last_direction = direction

	# left vs right
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			$AnimatedSprite2D.play("right")
		else:
			$AnimatedSprite2D.play("left")
	else:
		# up vs down
		if direction.y > 0:
			$AnimatedSprite2D.play("front")
		else:
			$AnimatedSprite2D.play("back")
