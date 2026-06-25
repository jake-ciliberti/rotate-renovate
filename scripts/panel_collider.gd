class_name PanelCollider extends CollisionPolygon2D

var panels: Array[Node]
var combined_panels: Array[PackedVector2Array]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panels = get_tree().get_nodes_in_group("panels")
	create_bounds()

func create_bounds():
	
	print(panels)
	
	for i in panels:
		print("panel: ")
		print(i.get_polygon())
		print("polygon: ")
		print(polygon)
		print(Geometry2D.merge_polygons(polygon, i.get_polygon()))
		polygon = Geometry2D.merge_polygons(polygon, i.get_polygon())[0]
		print("polygon: ")
		print(polygon)
		

func _draw():
	var godot_blue : Color = Color("478cbf")
	# We pass the PackedVector2Array to draw the shape.
	draw_polygon(polygon, [ godot_blue ])
