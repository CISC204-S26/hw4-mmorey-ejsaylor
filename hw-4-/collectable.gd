extends Area2D

class_name Collectable

@export var item_name: String = "Gem"

func interact() -> void:
	print("Collected: " + item_name)
	queue_free()
