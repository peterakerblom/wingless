extends Powerup
class_name IncreaseSpeed

@export var speed_boost: float = 10.0
#@export var powerup_duration: float = 5.0

signal timeout

func apply(target: Node):
	increase_speed()

func remove(target: Node):
	PlayerStats.player_speed -= speed_boost
	print("Speedboost over")

func increase_speed() -> void:
	PlayerStats.player_speed += speed_boost
	print("Speedboost started")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
