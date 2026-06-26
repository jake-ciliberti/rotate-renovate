class_name PanelHitbox extends CollisionPolygon2D

func _ready():
	visible = false

func _draw() -> void:
	# We are going to paint with this color.
	# We pass the PackedVector2Array to draw the shape.
	draw_polygon(polygon, [ Color(0.8, 0.8, 0, 0.5) ])
