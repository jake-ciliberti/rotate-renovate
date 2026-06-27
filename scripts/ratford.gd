extends Area2D

var dialogue_available: bool
var in_dialogue: bool
var dialogue_text: Array[String] = ["Hey, pipsqueak.", "I know, I know; I don't want to be out here either. But we've got a job to do.", "A human washing machine has broken down, and _someone_ needs to fix it.", "These human contraptions are just like everything else in this place:", "cheap and **GARBAGE**!", "You see how all our pixels are different sizes and how the assets don't always quite work together?", "If I didn't know any better, I'd say that whoever made this place was on a bit of a time crunch!", "And you, you tenacious little tarsier!", "You're the only thing that's worth a damn in this **F***ED** up world of ours!", "And... you're my only employee teeny tiny enough to fit inside the washing machine.", "So let's you and me get ourselves to work!", "...", "Oh, no, I'm not moving yet. I need to finish my smoke break. You go on ahead; I'll catch up."]
var dialogue_counter: int = 0
@export var dialogue_window: CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	dialogue_window.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and dialogue_available:
		if !in_dialogue:
			in_dialogue = true
			dialogue_window.show()
		
		if dialogue_counter < dialogue_text.size():
			dialogue_window.control.text.text = dialogue_text[dialogue_counter]
			dialogue_counter += 1
		else:
			dialogue_counter = 0
			dialogue_window.hide()
			in_dialogue = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		dialogue_available = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		dialogue_available = false
		dialogue_counter = 0
		dialogue_window.hide()
		in_dialogue = false
