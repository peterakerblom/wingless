extends TileMapLayer

@export var flower_scene = preload("res://scenes/flowers/red_tulip.tscn")
@export var flower_spawn_interval_min: float = 0.1
@export var flower_spawn_interval_max: float = 0.2
@export var max_flower_count: int = 15

var timer: Timer
var spawn_positions: Array[Vector2] = []

func _ready():
	spawn_positions = get_spawn_positions_from_tilemap()

	# Skapa och starta Timer
	timer = Timer.new()
	timer.one_shot = false
	timer.wait_time = randf_range(flower_spawn_interval_min, flower_spawn_interval_max)
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	timer.start()

func get_spawn_positions_from_tilemap() -> Array[Vector2]:
	var positions: Array[Vector2] = []

	for cell in get_used_cells():  # Lager 0
		var tile_data = get_cell_tile_data(cell)
		if tile_data and tile_data.get_custom_data("plant_spawn_tile"):
			var world_pos = map_to_local(cell)
			positions.append(world_pos)

	return positions

func _on_timer_timeout() -> void:
	if spawn_positions.is_empty():
		return

	var flower_count = get_node("../Flowers").get_child_count()
	if flower_count >= max_flower_count:
		return

	var random_index = randi() % spawn_positions.size()
	var spawn_position = spawn_positions[random_index]

	var instance = flower_scene.instantiate()
	instance.add_to_group("Flowers")
	instance.position = spawn_position
	get_node("../Flowers").add_child(instance)

	set_random_spawn_interval()


func set_random_spawn_interval():
	timer.wait_time = randf_range(flower_spawn_interval_min, flower_spawn_interval_max)
