extends Area2D

@export var prompt_text: String = "Press E to interact"
@export var message_text: String = "Wrong key!"

var player_inside: bool = false
var message_label: $"../Label2"

func _ready() -> void:
	message_label = get_tree().current_scene.get_node("CanvasLayer/MessageLabel")

func _process(_delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("interact"):
		show_text(message_text)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_inside = true
		show_text(prompt_text)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_inside = false
		hide_text()

func show_text(text: String) -> void:
	message_label.text = text
	message_label.visible = true

func hide_text() -> void:
	message_label.visible = false
