extends "level.gd"

@export var testPanel: NodePath

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_groups.append(testPanel)
