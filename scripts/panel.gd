class_name GamePanel extends Area2D

@export var reversed: bool = false
@export var group: int
@export var hitbox: PanelHitbox
@export var audio: AudioStreamPlayer2D

var initial_rotation_degrees = rotation_degrees

signal redraw

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = true
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	add_to_group("panels")

func _process(_delta: float) -> void:
	if Input.is_action_just_released("rotate_counterclockwise") or Input.is_action_just_released("rotate_clockwise"):
		audio.stop()

func change_rotation(selected_group: int, rotation_change: float) -> void:
	if selected_group != group:
		return
	
	if Input.is_action_just_pressed("rotate_counterclockwise") or Input.is_action_just_pressed("rotate_clockwise"):
		audio.play()
	
	if reversed:
		rotation_change *= -1
	
	rotation += rotation_change

func reset() -> void:
	rotation_degrees = initial_rotation_degrees

func get_global_position_and_rotation() -> PackedVector2Array:
	return transform * hitbox.transform * hitbox.get_polygon()

func highlight(selected_group: int) -> void:
	if selected_group != group:
		hitbox.color = Color(0.05, 0.1, 0.1)
		hitbox.z_index = 1
	
	else:
		hitbox.color = Color(0.05, 0.15, 0.15)
		hitbox.z_index = 2
		
	hitbox.queue_redraw()

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
