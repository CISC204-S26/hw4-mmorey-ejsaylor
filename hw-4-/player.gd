extends CharacterBody2D

@export var speed: float = 200.0

@onready var sprite = $Sprite2D

func _physics_process(_delta):
	var direction = Vector2.ZERO

	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_key_pressed(KEY_W):
		direction.y -= 1
	if Input.is_key_pressed(KEY_S):
		direction.y += 1

	velocity = direction * speed
	move_and_slide()


func take_damage():
	sprite.modulate = Color(1, 0, 0) # flash red
	await get_tree().create_timer(0.2).timeout
	sprite.modulate = Color(1, 1, 1) # back to normal
