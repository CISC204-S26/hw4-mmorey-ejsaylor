extends Area2D

@export var enemies: Array[Node2D]

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Player entered zone")
		for enemy in enemies:
			if enemy:
				enemy.activate(body)  # ✅ ONLY ONE ARGUMENT

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Player exited zone")
		for enemy in enemies:
			if enemy:
				enemy.deactivate()
