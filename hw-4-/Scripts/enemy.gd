extends CharacterBody2D

@export var speed: float = 100.0
@export var max_distance: float = 200.0  # how far enemy can go from start

var player: Node2D = null
var active: bool = false
var start_position: Vector2

func _ready():
	start_position = global_position


func activate(p: Node2D):
	player = p
	active = true


func deactivate():
	active = false
	player = null


func _physics_process(delta):
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


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage()
