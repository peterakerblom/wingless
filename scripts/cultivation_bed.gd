#@tool
extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var rect_shape: RectangleShape2D = collision_shape.shape

@export var flower_scene = preload("res://scenes/flowers/red_tulip.tscn")
@export var flower_spawn_interval_min: float = 5.0
@export var flower_spawn_interval_max: float = 10.0

var timer : Timer

func _ready():
	update_sprite_scale()
	timer = $Timer
	set_random_spawn_interval()
	timer.one_shot = false  # Så att timern fortsätter återkomma
	timer.start()  # Starta timern direkt

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

func _on_timer_timeout() -> void:
	# Hämta Area2D's storlek (rektangelns storlek från kollisionen)
	var area_size = rect_shape.size  # Om din Area2D är en rektangel
	var area_position = global_position  # Om positionen är global (beroende på var area2D:n ligger)
	
	# Generera en slumpmässig position inom området
	var random_position = Vector2(
		randf_range(area_position.x, area_position.x + area_size.x),  # X position inom området
		randf_range(area_position.y, area_position.y + area_size.y)   # Y position inom området
	)
	
	# Spawna scenen på den slumpmässiga positionen
	var instance = flower_scene.instantiate()
	instance.position = random_position  # Sätt den slumpmässiga positionen
	get_parent().add_child(instance)  # Lägg till den spawna scenen som ett barn till föräldern

func set_random_spawn_interval():
	var random_interval = randf_range(flower_spawn_interval_min, flower_spawn_interval_max)
	timer.wait_time = random_interval  # Uppdatera timern med det nya intervallet
