extends Area2D

@export var sprite: AnimatedSprite2D
var copy: Area2D
var cleanable: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.play("default")
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	tree_exiting.connect(_on_tree_exiting)
	add_to_group("water")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_rotation = 0
	if global_position.y > 826:
		queue_free()
	if global_position.y < 810 and copy == null:
		copy = duplicate()
		copy.position.y = 32
		copy.position.x = 0
		add_child(copy)
	if cleanable and Input.is_action_pressed("interact"):
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.is_swimming = true
		cleanable = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.is_swimming = false
		cleanable = false

func _on_tree_exiting() -> void:
	if copy != null:
		copy.queue_free()
