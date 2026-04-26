extends Node2D

var player_inside = false

var dialogue = [
	"Welcome, traveler.",
	"Your journey begins now.",
    "Find the hidden relic."
]

var current_line = 0
var talking = false

@onready var bubble = $"../player/SpeechBubble"

func _ready():
	bubble.visible = false

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact"):
		if not talking:
			start_dialogue()
		else:
			next_line()

func start_dialogue():
	talking = true
	current_line = 0
	show_line()

func next_line():
	current_line += 1
	if current_line >= dialogue.size():
		end_dialogue()
	else:
		show_line()

func show_line():
	bubble.visible = true
	bubble.text = dialogue[current_line]

func end_dialogue():
	bubble.visible = false
	talking = false


# SIGNALS FROM OracleArea
func _on_oracle_area_body_entered(body):
	if body.name == "player":
		player_inside = true

func _on_oracle_area_body_exited(body):
	if body.name == "player":
		player_inside = false
