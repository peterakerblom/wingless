extends Powerup
class_name IncreaseSpeed

@export var factor: float = 2.0  # kan ställas i editorn

func apply(target: Node):
	#if target.has_method("increase_speed"):
		#target.increase_speed()
	increase_speed()
	print("Speed applied to", target.name)

func increase_speed():
	PlayerStats.player_speed += 25.0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
