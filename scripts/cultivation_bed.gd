extends Area2D

@onready var color_rect: ColorRect = $ColorRect
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var rect_shape: RectangleShape2D = collision_shape.shape

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var size = rect_shape.size
	color_rect.size = size
	color_rect.position = -size / 2  # Centrerar rektangeln.

	print("ColorRect Size:", color_rect.size)
	print("ColorRect Position:", color_rect.position)
	print("ColorRect Color:", color_rect.color)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var size = rect_shape.size
	color_rect.size = size
	color_rect.position = -size / 2
