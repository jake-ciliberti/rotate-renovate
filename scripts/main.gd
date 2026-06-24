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

# NOTE: switching levels this way requires changing the z-index of Player. There's probably a better way to do this.
#func load_level(new_level: int):
	#level_container.load_level(new_level)

func _on_level_container_reset_player(spawnpoint: Vector2):
	player.teleport(spawnpoint)
