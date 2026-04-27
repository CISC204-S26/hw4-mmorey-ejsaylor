extends Area2D


@export var prompt_text: String = "Press E to check generator"

var player_in_range: Node = null

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player_in_range = body
		body.set_interactable(self, prompt_text)

func _on_body_exited(body: Node) -> void:
	if body == player_in_range:
		body.clear_interactable(self)
		player_in_range = null

func interact() -> void:
	if player_in_range == null:
		return

	if GameManager.generator_fixed:
		player_in_range.show_message("Generator is on.")
	else:
		player_in_range.show_message("Generator is off.")
