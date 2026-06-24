extends "level.gd"

@export var testPanel: AnimatableBody2D
@export var testPanel2: AnimatableBody2D
@export var testPanel3: AnimatableBody2D

# Called when the node enters the scene tree for the first time.
func make_groups() -> void:
	rotation_groups = [[testPanel], [testPanel2, testPanel3]]
