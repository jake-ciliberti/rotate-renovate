@abstract
class_name Level extends Node2D

# level setup
@export var spawnpoint: Vector2 = Vector2(512, 408)

# runtime variables
var selected_rotation_group = 0 # TODO: figure out how to move this to player
var rotation_groups: Array[Array]

var rotation_direction = 0

signal teleport

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	teleport.emit(spawnpoint)
	make_groups()

func make_groups() -> void:
	rotation_groups = [[]]

func rotate_panels(delta: float) -> void:
	rotation_direction = Input.get_axis("rotate_counterclockwise", "rotate_clockwise")
	for i in rotation_groups[selected_rotation_group]:
		i.rotation += rotation_direction * Globals.ROTATION_SPEED * delta

func change_selection():
	var direction = Input.get_axis("select_prev", "select_next")
	
	if direction > 0:
		selected_rotation_group += 1
		if selected_rotation_group >= rotation_groups.size():
			selected_rotation_group = 0
	elif direction < 0:
		selected_rotation_group -= 1
		if selected_rotation_group < 0:
			selected_rotation_group = rotation_groups.size() -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# There has to be a better way to do this. idk what it is yet. oops.
	if Input.is_action_pressed("rotate_counterclockwise") or Input.is_action_pressed("rotate_clockwise"):
		rotate_panels(delta);
	
	if Input.is_action_just_pressed("select_prev") or Input.is_action_just_pressed("select_next"):
		change_selection()
	
	if Input.is_action_just_pressed("reset"):
		_ready()
		
		for i in rotation_groups:
			for j in i:
				j.reset() 
