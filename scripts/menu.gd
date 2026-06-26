extends Control

@export var start: Button 
@export var select: Button 

signal load_level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	start.press.connect(_on_start_press)
	
func _on_start_press() -> void:
	load_level.emit(0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
