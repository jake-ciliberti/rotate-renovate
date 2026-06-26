class_name GamePanel extends Area2D

@export var group: int
@export var hitbox: PanelHitbox

var initial_rotation_degrees = rotation_degrees

signal redraw

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = true
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	add_to_group("panels")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func change_rotation(selected_group: int, rotation_change: float) -> void:
	if selected_group != group:
		return
	
	rotation += rotation_change

func reset() -> void:
	rotation_degrees = initial_rotation_degrees

func get_global_position_and_rotation() -> PackedVector2Array:
	return transform * hitbox.transform * hitbox.get_polygon()

func highlight(selected_group: int) -> void:
	if selected_group != group:
		return
	
	else:
		pass

func _on_body_entered(body: Node2D):
	if (body.name == "Player"):
		add_to_group("current_panels")
		redraw.emit()

func _on_body_exited(body: Node2D):
	if (body.name == "Player"):
		remove_from_group("current_panels")
		redraw.emit()

func _exit_tree() -> void:
	remove_from_group("current_panels")
