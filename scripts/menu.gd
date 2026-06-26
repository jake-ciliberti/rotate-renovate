extends Control

@export var start: Button 
@export var select: Button 

signal load_level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start.press.connect(_on_start_press)
	select.press.connect(_on_select_press)
	
func _on_start_press() -> void:
	load_level.emit(0)
	visible = false;

func _on_select_press(new_level_number):
	load_level.emit(new_level_number)
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("menu"):
		visible = !visible
