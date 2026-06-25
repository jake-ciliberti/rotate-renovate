class_name PanelCollider extends CollisionPolygon2D

var panels: Array[Node]
var combined_panels: Array[PackedVector2Array]

var default_polygon: PackedVector2Array = polygon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panels = get_tree().get_nodes_in_group("panels")
	create_bounds()

# TODO: broken. create a new polygon class with a unique group, and use clipping to create the polygons. do queue_free() on all the old polygons first (as a signal)
func create_bounds():
	
	print(panels)
	
	polygon = default_polygon
	
	for i in panels:\
		polygon = Geometry2D.merge_polygons(polygon, i.get_polygon() * i.transform)[0]

func _draw():
	var godot_blue : Color = Color("478cbf")
	# We pass the PackedVector2Array to draw the shape.
	draw_polygon(polygon, [ godot_blue ])
