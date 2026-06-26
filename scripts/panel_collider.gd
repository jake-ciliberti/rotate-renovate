class_name PanelCollider extends CollisionPolygon2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	build_mode = CollisionPolygon2D.BUILD_SEGMENTS
	add_to_group("colliders")
