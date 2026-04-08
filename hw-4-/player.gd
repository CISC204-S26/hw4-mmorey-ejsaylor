extends CharacterBody2D

@export var speed: float = 200.0

var current_interactable = null

func _physics_process(_delta: float) -> void:
	var input_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_vector * speed
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and current_interactable != null:
		current_interactable.interact()

func _on_interaction_area_area_entered(area: Area2D) -> void:
	current_interactable = area

func _on_interaction_area_area_exited(area: Area2D) -> void:
	if area == current_interactable:
		current_interactable = null
