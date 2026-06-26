class_name Door extends Area2D

signal level_finished

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("doors")
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	if (body.name == "Player"):
		print("level finished!")
		level_finished.emit()
