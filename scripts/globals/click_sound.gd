extends Node

var click_sound: AudioStreamPlayer

func _ready():
	# Skapa AudioStreamPlayer via kod
	click_sound = AudioStreamPlayer.new()
	add_child(click_sound)
	
	# Ladda ljudfilen från resursen
	click_sound.stream = load("res://assets/sound/click_sound.wav")
	
func play_click() -> void:
	click_sound.play()
