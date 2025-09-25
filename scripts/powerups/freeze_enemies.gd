extends Powerup
class_name FreezeEnemies

#@export var duration: float = 3.0

func apply(target: Node):
	print("Enemies frozen for seconds!")
	# Här kan du signalera eller kalla en EnemyManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
