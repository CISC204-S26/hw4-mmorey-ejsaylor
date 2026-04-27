extends CharacterBody2D

@export var speed: float = 200.0
@onready var sprite = $Sprite2D

var current_interactable: Node = null
var prompt_label: Label = null
var e_was_pressed: bool = false

func _ready() -> void:
	prompt_label = get_node_or_null("CanvasLayer/Label")
	
	if prompt_label != null:
		prompt_label.text = ""
	else:
		print("Player is missing CanvasLayer/Label.")

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

func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_E):
		if e_was_pressed == false:
			e_was_pressed = true
			print("E was pressed")

			if current_interactable != null:
				print("Trying to interact with: ", current_interactable.name)

				if current_interactable.has_method("interact"):
					current_interactable.interact()
				else:
					print("This object has no interact function.")
			else:
				print("No interactable selected.")
	else:
		e_was_pressed = false



func take_damage() -> void:
	sprite.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.2).timeout
	sprite.modulate = Color(1, 1, 1)

func _on_hitbox_body_entered(body: Node) -> void:
	if body.is_in_group("enemy"):
		take_damage()

	if Input.is_action_just_pressed("interact"):
		print("E was pressed")

		if current_interactable != null:
			print("Trying to interact with: ", current_interactable.name)

			if current_interactable.has_method("interact"):
				current_interactable.interact()
			else:
				print("This object has no interact function.")
		else:
			print("No interactable selected.")


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
