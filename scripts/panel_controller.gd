class_name PanelController extends Node2D

var selected_rotation_group: int

@export var number_of_groups: int = 1 # TODO: there should be a programmatic way to do this. figure that out
@export var collision: CollisionController

func _ready() -> void:
	Globals.redraw.connect(collision._ready)

func reset() -> void:
	get_tree().call_group("panels", "reset")
	collision._ready()

func change_selection() -> void:
	var direction = Input.get_axis("select_prev", "select_next")
	
	if direction > 0:
		selected_rotation_group += 1
		if selected_rotation_group >= number_of_groups:
			selected_rotation_group = 0
	elif direction < 0:
		selected_rotation_group -= 1
		if selected_rotation_group < 0:
			selected_rotation_group = number_of_groups - 1
	
	get_tree().call_group("panels", "highlight", selected_rotation_group)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_tree().get_node_count_in_group("colliders") > 1:
		get_tree().call_group("colliders", "queue_free")
		collision.make_static_bounds()
	
	if Input.is_action_pressed("rotate_counterclockwise") or Input.is_action_pressed("rotate_clockwise"):
		var rotation_direction = Input.get_axis("rotate_counterclockwise", "rotate_clockwise")
		get_tree().call_group("panels", "change_rotation", selected_rotation_group, rotation_direction * Globals.ROTATION_SPEED * delta)
		collision.make_moving_bounds()
	
	if Input.is_action_just_pressed("select_prev") or Input.is_action_just_pressed("select_next"):
		change_selection()
