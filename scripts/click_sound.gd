extends Node

var click_sound: AudioStreamPlayer

func _ready():
	#get_tree().node_added.connect(_on_node_added)
	# Skapa AudioStreamPlayer via kod
	click_sound = AudioStreamPlayer.new()
	add_child(click_sound)
	
	# Ladda ljudfilen från resursen
	click_sound.stream = load("res://assets/sound/click_sound.wav")
	#click_sound.volume_db = 0  # Justera volym om du vill
	
func play_click() -> void:
	click_sound.play()
	#
#func _on_node_added(node):
	#if node is Button:
		#node.pressed.connect(play_click)
