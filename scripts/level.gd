@abstract
class_name Level extends Node2D

# @export var player: NodePath

var selected_rotation_group = 0 # TODO: figure out how to move this to player
@export var rotation_groups: Array[Array]

var rotation_direction = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func rotate_panels(delta: float) -> void:
	rotation_direction = Input.get_axis("rotate_counterclockwise", "rotate_clockwise")
	# TODO: fix
	for i in rotation_groups[selected_rotation_group]:
		i.rotation += rotation_direction * Globals.ROTATION_SPEED * delta

func change_selection():
	selected_rotation_group = Input.get_axis("select_prev", "select_next")
	
	# TODO: get rid of conditionals maybe?
	if selected_rotation_group < 0:
		selected_rotation_group = rotation_groups.size() -1
	elif selected_rotation_group >= rotation_groups.size():
		selected_rotation_group = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# TODO: make both of these conditional for performance and to avoid jittering
	rotate_panels(delta);
		
	change_selection()
		
	pass
