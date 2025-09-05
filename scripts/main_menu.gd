extends Control

@onready var play_btn = $VBoxContainer/TextureButtonPlay
@onready var options_btn = $VBoxContainer/TextureButtonOptions
@onready var exit_btn = $VBoxContainer/TextureButtonExit

func _ready() -> void:
	play_btn.pressed.connect(_on_play_button_pressed)
	options_btn.pressed.connect(_on_options_button_pressed)
	exit_btn.pressed.connect(_on_exit_button_pressed)

func _process(delta: float) -> void:
	pass

func _on_play_button_pressed() -> void:
	print_debug("PLAYING")
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _on_options_button_pressed() -> void:
	print("OPTIONS")
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()	
