class_name GamePanel extends Polygon2D

@export var pivot: Vector2
@export var group: int

var initial_rotation_degrees = rotation_degrees

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("panels")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func change_rotation(selected_group: int, rotation_change: float):
	if selected_group != group:
		return
	
	rotation += rotation_change

func reset() -> void:
	rotation_degrees = initial_rotation_degrees

func highlight(selected_group: int) -> void:
	if selected_group != group:
		return
	
	else:
		pass
