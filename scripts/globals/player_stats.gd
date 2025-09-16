extends Node

var player_speed: float = 80.0
var player_speed_default: float = 80.0
var player_acceleration: float = 800.0
var player_friction: float = 600.0
var player_rotation: float = 10.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset_player_stats() -> void:
	player_speed = player_speed_default
