extends Control

@onready var back_btn: Button = $CanvasLayer/VBoxContainer/ButtonBack
@onready var volume_slider: HSlider = $CanvasLayer/VBoxContainer/HSliderVolume
@onready var fullscreen_checkbox: CheckBox = $CanvasLayer/VBoxContainer/CheckBoxFullScreen

func _ready() -> void:

	var cfg = ConfigFile.new()
	if cfg.load("user://settings.cfg") == OK:
		if cfg.has_section_key("audio", "volume"):
			var saved_val = cfg.get_value("audio", "volume")
			volume_slider.value = saved_val

	back_btn.pressed.connect(_on_back_pressed)
	volume_slider.value_changed.connect(_on_volume_changed)
	fullscreen_checkbox.toggled.connect(_on_fullscreen_toggled)
	
	var idx = AudioServer.get_bus_index("Master")
	var db = AudioServer.get_bus_volume_db(idx)
	volume_slider.value = db_to_linear(db) * 100

func _process(delta: float) -> void:
	pass

func _on_back_pressed() -> void:
	ClickSound.play_click()
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func _on_volume_changed(value: float) -> void:
	ClickSound.play_click()
	var idx = AudioServer.get_bus_index("Master")
	var linear = value / 100.0
	var db = linear_to_db(linear)
	AudioServer.set_bus_volume_db(idx, db)
	print_debug("Volume set to %s (%s dB)" % [value, db])

	# Spara till config
	var cfg = ConfigFile.new()
	cfg.set_value("audio", "volume", value)
	cfg.save("user://settings.cfg")

func _on_fullscreen_toggled(button_pressed: bool) -> void:
	ClickSound.play_click()
	if button_pressed:
		print("pressed")
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		print("unpressed")
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
