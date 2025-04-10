#@tool
extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var rect_shape: RectangleShape2D = collision_shape.shape

func _ready():
	update_sprite_scale()

#func _process(delta):
	#if Engine.is_editor_hint():
		#update_sprite_scale()

func update_sprite_scale():
	if sprite.texture and rect_shape:
		var target_size = rect_shape.size
		var sprite_size = sprite.texture.get_size()

		# Skala spriten så att den matchar kollisionen
		var scale = Vector2(
			target_size.x / sprite_size.x,
			target_size.y / sprite_size.y
		)

		# Sätt rätt skala på spriten
		sprite.scale = scale

		# Centrera spriten genom att justera dess position
		# Anpassa till mitten av kollisionen
		#sprite.position = Vector2(-target_size.x / 2, -target_size.y / 2)
