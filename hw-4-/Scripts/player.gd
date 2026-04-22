extends CharacterBody2D

@export var speed: float = 200.0

var nearby_interactables = []

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_key_pressed(KEY_W):
		direction.y -= 1
	if Input.is_key_pressed(KEY_S):
		direction.y += 1

	if Input.is_action_just_pressed("Interact"):
		if nearby_interactables.size() > 0:
			nearby_interactables.back().interact()

	velocity = direction * speed
	move_and_slide()


	


func _on_interaction_area_area_entered(area: Area2D) -> void:
	print("interactable detected")
	nearby_interactables.append(area)


func _on_interaction_area_area_exited(area: Area2D) -> void:
	print("interactable exited")
	nearby_interactables.erase(area)
