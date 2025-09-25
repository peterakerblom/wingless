extends Resource
class_name Powerup

@export var powerup_duration: float

# Varje powerup kan skriva över detta
func apply(target: Node):
	push_warning("apply() not implemented for powerup")

# Körs när powerup tar slut
func remove(target: Node):
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
