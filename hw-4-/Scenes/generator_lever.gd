extends Area2D


@export var prompt_text: String = "Press E to pull lever"

var player_in_range: Node = null

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = body
		body.set_interactable(self, prompt_text)

func _on_body_exited(body):
	if body == player_in_range:
		body.clear_interactable(self)
		player_in_range = null

func interact():
	if GameManager.generator_fixed:
		player_in_range.show_message("Already on.")
		return

	if not GameManager.fuse_installed:
		player_in_range.show_message("Needs fuse first.")
		return

	GameManager.generator_fixed = true
	player_in_range.show_message("Generator restored!")
