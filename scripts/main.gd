extends Node2D

@export var player: CharacterBody2D
@export var level: Level # TODO: figure out how to allow this to swap levels

var level_number = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level.reset.connect(_on_level_reset)
	# load_level(level_number) # TODO: doesn't work. fix!

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func load_level(new_level: int):
	level_number = new_level
	
	level.get_tree().change_scene_to_file("res://levels/level_" + str(level_number) + ".tscn")

func increment_level():
	load_level(level_number + 1)

func _on_level_reset(spawnpoint: Vector2):
	player.teleport(spawnpoint)
