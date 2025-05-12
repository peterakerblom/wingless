extends StaticBody2D

var timer : Timer
#@export var wasp_spawn_interval_min: float = 2.0
#@export var wasp_spawn_interval_max: float = 5.0
@export var flip_texture : bool = false

@onready var wasp_scene = preload("res://scenes/enemies/wasp.tscn")
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var rect_shape: RectangleShape2D = collision_shape.shape

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $Timer
	set_random_spawn_interval()
	timer.one_shot = false  # Så att timern fortsätter återkomma
	timer.start()  # Starta timern direkt


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var wasp = wasp_scene.instantiate()
	if flip_texture:
		wasp.flipped = true
		wasp.apply_flipped()
	var area_size = rect_shape.size
	var area_position = global_position 
	var random_position = Vector2(
		randf_range(area_position.x, area_position.x + area_size.x),  # X position inom området
		randf_range(area_position.y, area_position.y + area_size.y)   # Y position inom området
	)
	wasp.position = random_position 
	get_parent().get_parent().get_node("Enemies").add_child(wasp)

	set_random_spawn_interval()

func set_random_spawn_interval():
	#var random_interval = randf_range(wasp_spawn_interval_min, wasp_spawn_interval_max)
	var random_interval = randf_range(GameManager.min_enemy_spawn_time, GameManager.max_enemy_spawn_time)
	print("setting new time intervall")
	timer.wait_time = random_interval 
