@abstract
extends AnimatableBody2D

@export var initial_rotation_degrees: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func reset():
	rotation_degrees = initial_rotation_degrees
