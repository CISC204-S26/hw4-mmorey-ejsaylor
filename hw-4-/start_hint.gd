extends CanvasLayer

@onready var label = $Label

func _ready():
	label.visible = true
	label.text = "Speak to the oracle"

	await get_tree().create_timer(3.0).timeout
	label.visible = false
