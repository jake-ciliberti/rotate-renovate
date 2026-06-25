class_name PanelController extends AnimatableBody2D

var selected_rotation_group: int

@export var number_of_groups: int = 1 # TODO: there should be a programmatic way to do this. figure that out
@export var collider: PanelCollider

func reset():
	get_tree().call_group("panels", "reset")
	collider._ready()

func change_selection():
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
	if Input.is_action_pressed("rotate_counterclockwise") or Input.is_action_pressed("rotate_clockwise"):
		var rotation_direction = Input.get_axis("rotate_counterclockwise", "rotate_clockwise")
		get_tree().call_group("panels", "change_rotation", selected_rotation_group, rotation_direction * Globals.ROTATION_SPEED * delta)
	
	if Input.is_action_just_pressed("select_prev") or Input.is_action_just_pressed("select_next"):
		change_selection()
