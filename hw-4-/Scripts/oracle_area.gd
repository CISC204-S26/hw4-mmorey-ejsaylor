extends Area2D

var player_inside = false

func _on_body_entered(body):
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false
		
		


func _on_area_exited(area: Area2D) -> void:
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
