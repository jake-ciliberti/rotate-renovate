extends Button





func _ready():
	var button = Button.new()
	button.text = "Click me"
	button.pressed.connect(_button_pressed)
	add_child(button)
	print("Hello smeelo!")
func _button_pressed():
	print("Hello world!")
	load("res://levels/level_0.tscn")
