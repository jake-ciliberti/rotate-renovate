extends Node2D

@export var player: CharacterBody2D
@export var level_container: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_container.reset_player.connect(_on_level_container_reset_player)
	level_container.load_level(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_level_container_reset_player(spawnpoint: Vector2) -> void:
	player.teleport(spawnpoint)
