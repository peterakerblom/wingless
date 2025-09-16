extends Powerup
class_name IncreaseSpeed

@export var factor: float = 2.0  # kan ställas i editorn

func apply(target: Node):
	increase_speed()

func increase_speed():
	PlayerStats.player_speed += 25.0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
