class_name MovingPanelCollider extends CollisionPolygon2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("colliders")

# NOTE: useful for debugging
func _draw() -> void:
	# We are going to paint with this color.
	# var godot_blue : Color = Color("478cbf")
	# We pass the PackedVector2Array to draw the shape.
	# draw_polygon(polygon, [ godot_blue ])
	pass
