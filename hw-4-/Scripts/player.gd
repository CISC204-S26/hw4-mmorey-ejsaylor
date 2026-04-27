extends CharacterBody2D

@export var speed: float = 200.0
@onready var sprite = $Sprite2D

var current_interactable: Node = null
var prompt_label: Label = null

func _ready() -> void:
	add_to_group("player")

func _physics_process(_delta: float) -> void:
	var direction = Vector2.ZERO

	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_key_pressed(KEY_W):
		direction.y -= 1
	if Input.is_key_pressed(KEY_S):
		direction.y += 1

	velocity = direction.normalized() * speed
	move_and_slide()

func take_damage() -> void:
	sprite.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.2).timeout
	sprite.modulate = Color(1, 1, 1)

func _on_hitbox_body_entered(body: Node) -> void:
	if body.is_in_group("enemy"):
		take_damage()

func set_interactable(target: Node, prompt_text: String) -> void:
	current_interactable = target
	
	if prompt_label != null:
		prompt_label.text = prompt_text

func clear_interactable(target: Node) -> void:
	if current_interactable == target:
		current_interactable = null
		
		if prompt_label != null:
			prompt_label.text = ""

func show_message(text: String) -> void:
	if prompt_label != null:
		prompt_label.text = text
