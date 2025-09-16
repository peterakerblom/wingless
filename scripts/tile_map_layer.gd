extends TileMapLayer

@export var tulip_red = preload("uid://br0n6edb2wsce")
@export var tulip_yellow = preload("uid://d0tpgsdj10gpn")
@export var tulip_pink = preload("uid://ynetij171pjh")
@export var tulip_black = preload("uid://1htwuc48ian7")
@export var snowdrop = preload("uid://cy2ynsb0uc8tm")
@export var sunflower_yellow = preload("uid://oflg1kh26y6k")

@export var apple_scene = preload("uid://c2f2mh2vhsbme")

@export var flower_spawn_interval_min: float = 0.1
@export var flower_spawn_interval_max: float = 0.2
@export var max_flower_count: int = 15

@export var apple_spawn_interval_min: float = 1
@export var apple_spawn_interval_max: float = 2

var timer: Timer
var spawn_positions: Array[Vector2] = []

var apple_timer: Timer

func _ready():
	spawn_positions = get_spawn_positions_from_tilemap()

	# Skapa och starta Timer
	timer = Timer.new()
	timer.one_shot = false
	timer.wait_time = randf_range(flower_spawn_interval_min, flower_spawn_interval_max)
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	timer.start()
	
	# Create apple timer
	apple_timer = Timer.new()
	apple_timer.one_shot = false
	apple_timer.wait_time = randf_range(GameManager.min_apple_spawn_time, GameManager.max_apple_spawn_time)
	apple_timer.timeout.connect(_on_apple_timer_timeout)
	add_child(apple_timer)
	apple_timer.start()
	
	
func get_spawn_positions_from_tilemap() -> Array[Vector2]:
	var positions: Array[Vector2] = []

	for cell in get_used_cells():  # Lager 0
		var tile_data = get_cell_tile_data(cell)
		if tile_data and tile_data.get_custom_data("plant_spawn_tile"):
			var world_pos = map_to_local(cell)
			positions.append(world_pos)

	return positions

func _on_apple_timer_timeout() -> void:
	if spawn_positions.is_empty():
		return
	var random_index = randi() % spawn_positions.size()
	var spawn_position = spawn_positions[random_index]
	var instance = apple_scene.instantiate()
	instance.position = spawn_position
	get_node("../Enemies").add_child(instance)
	set_random_apple_spawn_interval()

func _on_timer_timeout() -> void:
	if spawn_positions.is_empty():
		return

	var flower_count = get_node("../Flowers").get_child_count()
	if flower_count >= max_flower_count:
		return

	var random_index = randi() % spawn_positions.size()
	var spawn_position = spawn_positions[random_index]
	
	var flower_type = randi_range(1, 20)
	var instance
	if flower_type <= 8:
		instance = tulip_red.instantiate()
	elif flower_type <= 12:
		instance = tulip_yellow.instantiate()
	elif flower_type <= 15:
		instance = tulip_pink.instantiate()
	elif flower_type <= 17:
		instance = tulip_black.instantiate()
	elif flower_type <= 19:
		instance = snowdrop.instantiate()
	else:
		instance = sunflower_yellow.instantiate()
		
	instance.add_to_group("Flowers")
	instance.position = spawn_position
	get_node("../Flowers").add_child(instance)

	set_random_spawn_interval()


func set_random_spawn_interval():
	if GameManager.is_player_alive:
		timer.wait_time = randf_range(flower_spawn_interval_min, flower_spawn_interval_max)
	else:
		timer.stop()

func set_random_apple_spawn_interval():
	if GameManager.is_player_alive:
		apple_timer.wait_time = randf_range(GameManager.min_apple_spawn_time, GameManager.max_apple_spawn_time)
	else:
		apple_timer.stop()
