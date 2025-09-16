extends Node

var score = 0
var high_score = 0

var min_enemy_spawn_time : float = 5.0
const min_enemy_spawn_time_default : float = 5.0

var max_enemy_spawn_time : float = 10.0
const max_enemy_spawn_time_default : float = 10.0

var min_apple_spawn_time : float = 4.0
const min_apple_spawn_time_default : float = 4.0

var max_apple_spawn_time : float = 8.0
const max_apple_spawn_time_default : float = 8.0

var wasp_speed = 100
const wasp_speed_default = 100

var current_level_number = 1
const current_level_number_default = 1

var is_player_alive: bool = true
var player: CharacterBody2D

func _ready():

	pass

func register_player(p):
	player = p
	player.player_died.connect(_on_player_died)

func _on_player_died():
	is_player_alive = false

func reset_enemy_spawner_timers():
	min_enemy_spawn_time = min_enemy_spawn_time_default
	max_enemy_spawn_time = max_enemy_spawn_time_default
	min_apple_spawn_time = min_apple_spawn_time_default
	max_apple_spawn_time = max_apple_spawn_time_default

func reset_high_score():
	score = 0
	high_score = 0

func reset_wasp_speed():
	wasp_speed = wasp_speed_default

func reset_level_number():
	current_level_number = current_level_number_default
