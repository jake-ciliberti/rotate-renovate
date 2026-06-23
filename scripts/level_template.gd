extends "level.gd"

@export var testPanel: Node2D
@export var testPanel2: Node2D
@export var testPanel3: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_groups = [[testPanel], [testPanel2, testPanel3]]
