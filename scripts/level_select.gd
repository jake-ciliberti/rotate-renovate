extends Button

@export var number_input: LineEdit

signal press

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	var new_level_number: int = int(number_input.text)
	press.emit(new_level_number)
