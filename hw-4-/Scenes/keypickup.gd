extends Area2D

var picked_up: bool = false 

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if picked_up:
		return
	
	if body.is_in_group("player"):
		picked_up = true
		
		GameManager.has_fuse = true
		
		if body.has_method("show_message"):
			body.show_message("Picked up key")
		
		queue_free()
