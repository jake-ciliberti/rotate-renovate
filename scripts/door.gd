class_name Door extends Area2D

signal level_finished

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	z_index = 2

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Player") and get_tree().get_node_count_in_group("water") == 0:
		level_finished.emit()
