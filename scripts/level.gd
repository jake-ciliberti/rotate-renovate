class_name Level extends Node2D

# level setup
@export var spawnpoint: Vector2 = Vector2(512, 408)
@export var group_number: int

@export var panel_controller: PanelController = get_node_or_null("PanelController") # TODO: make this programmatic

var rotation_direction = 0

signal reset

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset.emit(spawnpoint)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("reset"):
		reset.emit(spawnpoint)
		if panel_controller != null:
			panel_controller.reset()
