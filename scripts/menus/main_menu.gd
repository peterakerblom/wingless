extends Control

@onready var play_btn = $VBoxContainer/TextureButtonPlay
@onready var options_btn = $VBoxContainer/TextureButtonOptions
@onready var exit_btn = $VBoxContainer/TextureButtonExit
@onready var highscore_btn: TextureButton = $VBoxContainer/TextureButtonHighscore

func _ready() -> void:
	play_btn.pressed.connect(_on_play_button_pressed)
	highscore_btn.pressed.connect(_on_highscore_button_pressed)
	options_btn.pressed.connect(_on_options_button_pressed)
	exit_btn.pressed.connect(_on_exit_button_pressed)

func _process(delta: float) -> void:
	pass

func _on_play_button_pressed() -> void:
	print_debug("PLAYING")
	ClickSound.play_click()
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _on_highscore_button_pressed() -> void:
	print_debug("HIGHSCORES")
	ClickSound.play_click()
	get_tree().change_scene_to_file("res://scenes/ui/highscore_menu.tscn")

func _on_options_button_pressed() -> void:
	print("OPTIONS")
	ClickSound.play_click()
	get_tree().change_scene_to_file("res://scenes/ui/options_menu.tscn")

func _on_exit_button_pressed() -> void:
	ClickSound.play_click()
	await get_tree().create_timer(ClickSound.click_sound.stream.get_length()).timeout
	get_tree().quit()	
