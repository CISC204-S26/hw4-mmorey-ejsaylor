extends Area2D

@export_file("*.tscn") var target_scene: String

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player") and target_scene != "":
		call_deferred("go_to_scene")

func go_to_scene() -> void:
	get_tree().change_scene_to_file(target_scene)
