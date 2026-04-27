extends Area2D

@export_file("*.tscn") var target_scene: String
@export var locked_text: String = "Key needed"
@export var open_text: String = "Press E to enter"

var player_inside: CharacterBody2D = null
var message_label: Label

func _ready() -> void:
	message_label = get_tree().current_scene.get_node("Player/CanvasLayer/MessageLabel")

func _process(_delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("interact"):
		if player_inside.has_key and target_scene != "":
			go_to_scene()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_inside = body
		
		if player_inside.has_key:
			show_text(open_text)
		else:
			show_text(locked_text)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_inside = null
		hide_text()

func go_to_scene() -> void:
	get_tree().change_scene_to_file(target_scene)

func show_text(text: String) -> void:
	message_label.text = text
	message_label.visible = true

func hide_text() -> void:
	message_label.visible = false
