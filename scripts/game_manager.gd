extends Node

var score = 0
var high_score = 0

var min_enemy_spawn_time : int = 5
var min_enemy_spawn_time_default : int = 5

var max_enemy_spawn_time : int = 10
var max_enemy_spawn_time_default : int = 10

var wasp_speed = 100
var wasp_speed_default = 100

var current_level_number = 1
var current_level_number_default = 1

func reset_enemy_spawner_timers():
	min_enemy_spawn_time = min_enemy_spawn_time_default
	max_enemy_spawn_time = max_enemy_spawn_time_default

func reset_high_score():
	score = 0
	high_score = 0

func reset_wasp_speed():
	wasp_speed = wasp_speed_default

func reset_level_number():
	current_level_number = current_level_number_default
