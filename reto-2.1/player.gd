extends CharacterBody2D

@export var speed: float = 260.0

func _physics_process(_delta: float) -> void:
	var direction := Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1.0
	if Input.is_action_pressed("move_left"):
		direction.x -= 1.0
	if Input.is_action_pressed("move_down"):
		direction.y += 1.0
	if Input.is_action_pressed("move_up"):
		direction.y -= 1.0
	velocity = direction.normalized() * speed
	move_and_slide()
	position.x = clampf(position.x, 24.0, 1128.0)
	position.y = clampf(position.y, 430.0, 696.0)
