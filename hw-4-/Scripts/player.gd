extends CharacterBody2D

@export var speed: float = 200.0

var current_interactable: Node = null
var prompt_label: Label = null

func _ready() -> void:
	prompt_label = get_node_or_null("CanvasLayer/Label")
	
	if prompt_label != null:
		prompt_label.text = ""
		
func _physics_process(_delta):
	var direction = Vector2.ZERO

	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_key_pressed(KEY_W):
		direction.y -= 1
	if Input.is_key_pressed(KEY_S):
		direction.y += 1

	velocity = direction * speed
	move_and_slide()

	if Input.is_action_just_pressed("interact") and current_interactable != null:
		if current_interactable.has_method("interact"):
			current_interactable.interact()

func set_interactable(target: Node, prompt_text: String) -> void:
	current_interactable = target
	
	if prompt_label != null:
		prompt_label.text = prompt_text
		
func show_message(text: String) -> void:
	if prompt_label != null:
		prompt_label.text = text

func clear_interactable(target: Node) -> void:
	if current_interactable == target:
		current_interactable = null
		
		if prompt_label != null:
			prompt_label.text = ""
