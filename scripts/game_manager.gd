extends Node

var score = 0
var high_score = 0

var min_enemy_spawn_time : int = 5
var min_enemy_spawn_time_default : int = 5

var max_enemy_spawn_time : int = 10
var max_enemy_spawn_time_default : int = 10

func reset_enemy_spawner_timers():
	min_enemy_spawn_time = min_enemy_spawn_time_default
	max_enemy_spawn_time = max_enemy_spawn_time_default

func reset_high_score():
	score = 0
	high_score = 0
