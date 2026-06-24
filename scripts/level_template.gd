extends "level.gd"

@export var testPanel: AnimatableBody2D
@export var testPanel2: AnimatableBody2D
@export var testPanel3: AnimatableBody2D

func make_groups() -> void:
	rotation_groups = [[testPanel], [testPanel2, testPanel3]]
