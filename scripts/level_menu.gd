extends Control

@export var button: Button

signal next_level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	hide()
	next_level.emit()
