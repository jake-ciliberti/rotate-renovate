extends CollisionPolygon2D

func _draw() -> void:
	# We are going to paint with this color.
	# We pass the PackedVector2Array to draw the shape.
	draw_polygon(polygon, [ "white" ])
