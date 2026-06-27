extends Node2D

signal reset_player

@export var background_music: AudioStreamPlayer
@export var menu_music: AudioStreamPlayer
@export var menu: Control

var level: Level
var level_number = 0

func _ready() -> void:
	menu.next_level.connect.call_deferred(increment_level)
	menu.hide()
	background_music.stream_paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_text_backspace"):
		increment_level()

func unload_level() -> void:
	get_tree().call_group("kill", "queue_free")
	if (is_instance_valid(level)):
		level.queue_free()
	level = null

func load_level(new_level: int) -> void:
	unload_level()
	var level_path := "res://levels/level_%s.tscn" % new_level
	var level_resource := load(level_path)
	
	if !(level_resource):
		level_number = -1
		background_music.stream_paused = true
		return
	
	level = level_resource.instantiate()
	
	level.reset.connect(_on_level_reset)
	
	if level.door:
		level.door.level_finished.connect(_on_level_finished)
	
	add_child.call_deferred(level)
	
	level_number = new_level
	
	if level_number > 0:
		background_music.stream_paused = false
		menu_music.stop()

func increment_level() -> void:
	load_level(level_number + 1)

func _on_level_reset(spawnpoint: Vector2) -> void:
	reset_player.emit(spawnpoint)

func _on_level_finished() -> void:
	menu.show()
