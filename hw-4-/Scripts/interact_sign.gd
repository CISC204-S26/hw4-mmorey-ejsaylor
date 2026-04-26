extends Area2D

@export var prompt_text: String = "Press E to read"
@export_multiline var message_text: String = "Nothing interesting here."

var player_in_range: Node = null

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	print(name, " sign is ready")

func _on_body_entered(body: Node) -> void:
	print("Something entered sign: ", body.name)

	if body.is_in_group("player"):
		print("Player is near sign")
		player_in_range = body
		body.set_interactable(self, prompt_text)

func _on_body_exited(body: Node) -> void:
	if body == player_in_range:
		print("Player left sign")
		body.clear_interactable(self)
		player_in_range = null

func interact() -> void:
	if player_in_range != null:
		player_in_range.show_message(message_text)
