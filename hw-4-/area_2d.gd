extends Area2D

@export var enemies: Array[Node2D]

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		print("Player entered zone")
		for enemy in enemies:
			if enemy and enemy.has_method("activate"):
				enemy.activate(body)

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		print("Player exited zone")
		for enemy in enemies:
			if enemy and enemy.has_method("deactivate"):
				enemy.deactivate()
