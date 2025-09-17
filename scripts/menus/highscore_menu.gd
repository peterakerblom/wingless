extends Control

@onready var scores_container: VBoxContainer = $CanvasLayer/VBoxContainer/VBoxContainerScores

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_highscores()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_highscores() -> void:
	#v_box_container.queue_free_children()
	clear_children(scores_container)
	var all_highscores: Array = HighscoreManager.highscores
	for highscore in all_highscores:
		var row_label = Label.new()
		row_label.text = str("SCORE ", highscore.score, " - LEVEL: ", highscore.level)
		scores_container.add_child(row_label)

func clear_children(container: Node) -> void:
	for child in container.get_children():
		child.queue_free()

func _on_back_pressed() -> void:
	ClickSound.play_click()
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
