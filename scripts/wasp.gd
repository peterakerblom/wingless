extends CharacterBody2D

var flipped = false
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@export var speed: float = 300.0
var direction: Vector2 = Vector2.RIGHT

func _ready():
	pass

func _process(delta):
	position += direction * speed * delta
	var screen_rect = get_viewport().get_visible_rect()
	if not screen_rect.has_point(position):
		queue_free() 


func apply_flipped():
	if flipped:
		var txtrect = self.get_node("TextureRect")
		txtrect.scale.x *= -1
		direction = Vector2.LEFT
