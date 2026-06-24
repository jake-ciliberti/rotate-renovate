extends Node2D

@export var player: CharacterBody2D
@export var level: Level # TODO: figure out how to allow this to swap levels

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level.teleport.connect(player.teleport)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
