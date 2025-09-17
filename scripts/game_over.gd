extends Control

@onready var button_restart: Button = $CanvasLayer/VBoxContainer/ButtonRestart
@onready var button_main_menu: Button = $CanvasLayer/VBoxContainer/ButtonMainMenu
@onready var high_score_label: Label = $CanvasLayer/VBoxContainer/LabelHighScore

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_restart.pressed.connect(_on_restart_pressed)
	button_main_menu.pressed.connect(_on_main_menu_pressed)
	high_score_label.text = "High Score: " + str(GameManager.high_score)


func _on_restart_pressed():
	ClickSound.play_click()
	GameManager.reset_high_score()
	GameManager.reset_enemy_spawner_timers()
	GameManager.reset_wasp_speed()
	GameManager.reset_level_number()
	PlayerStats.reset_player_stats()
	get_tree().reload_current_scene()

func _on_main_menu_pressed():
	ClickSound.play_click()
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
