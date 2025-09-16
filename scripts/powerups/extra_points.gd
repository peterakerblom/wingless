extends Powerup
class_name ExtraPoints

@export var bonus_points: int = 2
@export var points_multiplier: int = 2

func apply(target: Node):
	if target.data:
		print(target)
		target.data.points = target.data.points + bonus_points
		pass
		#print("Extra points:", bonus_points, "from", target.data.plant_name)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
