extends Control

@onready var button_restart: Button = $CanvasLayer/VBoxContainer/ButtonRestart
@onready var high_score_label: Label = $CanvasLayer/VBoxContainer/LabelHighScore


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_restart.pressed.connect(_on_restart_pressed)
	high_score_label.text = "High Score: " + str(GameManager.high_score)


func _on_restart_pressed():
	GameManager.reset_high_score()
	GameManager.reset_enemy_spawner_timers()
	GameManager.reset_wasp_speed()
	GameManager.reset_level_number()
	get_tree().reload_current_scene()
