class_name PanelHitbox extends CollisionPolygon2D

var color: Color

func _ready():
	color = Color(0.05, 0.1, 0.1)

func _draw() -> void:
	# We are going to paint with this color.
	# We pass the PackedVector2Array to draw the shape.
	draw_polygon(polygon, [ color ])
