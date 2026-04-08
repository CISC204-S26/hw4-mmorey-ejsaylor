extends CharacterBody2D

@export var speed: float = 200.0

var nearby_interactables = null

func _physics_process(_delta: float) -> void:
	var input_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_vector * speed
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if nearby_interactables:
				nearby_interactables.back().interact()

func _on_interaction_area_area_entered(area: Area2D) -> void:
	print("interactable detected")
	area.set_active(true)
	nearby_interactables.append(area)

func _on_interaction_area_area_exited(area: Area2D) -> void:
	print("interactable detected")
	area.set_active(false)
	nearby_interactables.erase(area)
