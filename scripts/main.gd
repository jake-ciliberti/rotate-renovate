extends Node2D

@export var player: CharacterBody2D
@export var level_container: Node2D
@export var menu: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_container.reset_player.connect(_on_level_container_reset_player)
	menu.load_level.connect(_on_menu_load_level)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_level_container_reset_player(spawnpoint: Vector2) -> void:
	player.teleport(spawnpoint)

func _on_menu_load_level(level_number: int) -> void:
	level_container.load_level(level_number)
