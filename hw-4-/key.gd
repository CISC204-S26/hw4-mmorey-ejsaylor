extends Area2D

@export var prompt_text: String = "Press E to interact"
@export var success_text: String = "Right key! Press E to collect"

var player_inside: CharacterBody2D = null
var can_collect: bool = false
var message_label: Label

func _ready() -> void:
	message_label = get_tree().current_scene.get_node("Player/CanvasLayer/MessageLabel")

func _process(_delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("interact"):
		if not can_collect:
			show_text(success_text)
			can_collect = true
		else:
			collect_key()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_inside = body
		show_text(prompt_text)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_inside = null
		can_collect = false
		hide_text()

func show_text(text: String) -> void:
	message_label.text = text
	message_label.visible = true

func hide_text() -> void:
	message_label.visible = false

func collect_key() -> void:
	if player_inside:
		player_inside.has_key = true  # ✅ GIVE PLAYER THE KEY
	hide_text()
	queue_free()
