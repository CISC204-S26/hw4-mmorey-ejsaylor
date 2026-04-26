extends CharacterBody2D

@export var speed: float = 100.0

var player: Node2D = null
var active: bool = false
var start_position: Vector2

func _ready() -> void:
	start_position = global_position
	add_to_group("enemy")

func activate(p: Node2D) -> void:
	player = p
	active = true

func deactivate() -> void:
	active = false
	player = null

func _physics_process(delta: float) -> void:
	if active and is_instance_valid(player):
		global_position = global_position.move_toward(
			player.global_position,
			speed * delta
		)
	else:
		global_position = global_position.move_toward(
			start_position,
			speed * delta
		)
