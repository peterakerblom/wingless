extends Area2D

var flipped = false
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@export var speed: float = GameManager.wasp_speed
var direction: Vector2 = Vector2.RIGHT

func _ready():
	if flipped:
		apply_flipped()
	pass

func _process(delta):
	position += direction * speed * delta
	var screen_rect = get_viewport().get_visible_rect()
	if not screen_rect.has_point(position):
		queue_free() 


func apply_flipped():
	var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
	animated_sprite_2d.flip_v = true
	direction = Vector2.LEFT


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.take_damage()
