extends Node2D

signal reset_player

var level: Level
var level_number = 0

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_text_backspace"):
		increment_level()
	
	pass

func unload_level() -> void:
	if (is_instance_valid(level)):
		level.queue_free()
	level = null

func load_level(new_level: int) -> void:
	unload_level()
	var level_path := "res://levels/level_%s.tscn" % new_level
	var level_resource := load(level_path)
	
	if !(level_resource):
		level_number = -1
		return
	
	level = level_resource.instantiate()
	
	level.reset.connect(_on_level_reset)
	
	add_child(level)
	
	level_number = new_level
	
	return


func increment_level():
	load_level(level_number + 1)

func _on_level_reset(spawnpoint: Vector2):
	reset_player.emit(spawnpoint)
