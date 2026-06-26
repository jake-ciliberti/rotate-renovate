class_name CollisionController extends StaticBody2D

@export var wall_thickness := 400.0

var panels: Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TODO: create a default floor or see if this can be empty
	if (get_tree()):
		panels = get_tree().get_nodes_in_group("current_panels")
	set_collision_mask_value(1, false)
	set_collision_mask_value(2, true)
	make_static_bounds()

# TODO: broken. create a new polygon class with a unique group, and use clipping to create the polygons. do queue_free() on all the old polygons first (as a signal)
func create_bounds() -> PackedVector2Array:
	
	get_tree().call_group("colliders", "queue_free")
	
	var combined_panels: PackedVector2Array
	
	if panels.size() == 0:
		return []
	
	combined_panels = panels[0].get_global_position_and_rotation() # initalize combined_panels so that it can be merge later
	
	for i in panels:
		combined_panels = Geometry2D.merge_polygons(combined_panels, i.get_global_position_and_rotation())[0]
	
	print(combined_panels)
	
	return combined_panels

func make_static_bounds() -> void:
	var new_panel_collider = PanelCollider.new()
	new_panel_collider.polygon = create_bounds()
	add_child.call_deferred(new_panel_collider)
	
func make_moving_bounds() -> void:
	var combined_panels = create_bounds()
	build_walls(create_bounds())
	make_static_bounds()

func build_walls(poly) -> void:
	var count = poly.size()
	for i in count:
		var a = poly[i]
		var b = poly[(i + 1) % count]
		var dir = (b - a).normalized()
		var normal = Vector2(dir.y, -dir.x)
		var mid = (a + b) * 0.5
		# Make sure the normal points away from the walkable interior, not into it.
		if Geometry2D.is_point_in_polygon(mid + normal * 2.0, poly):
			normal = -normal
		# Stretch each end past the corner so neighbouring quads overlap and leave no gap.
		var a2 = a - dir * wall_thickness
		var b2 = b + dir * wall_thickness
		var quad = PackedVector2Array([
			a2,
			b2,
			b2 + normal * wall_thickness,
			a2 + normal * wall_thickness,
		])
		var new_panel_collider = MovingPanelCollider.new()
		new_panel_collider.polygon = quad
		add_child.call_deferred(new_panel_collider)
