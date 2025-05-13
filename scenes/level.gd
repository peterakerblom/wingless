extends Node2D

var score : int = 0
@onready var score_label = $CanvasLayer/ScoreLabel
@onready var level_label = $CanvasLayer/LevelLabel

@onready var levels = {
	"1": {
		"min": 9,
		"max": 10,
		"speed": 200
	},
	"2": {
		"min": 8,
		"max": 9,
		"speed": 220
	},
	"3": {
		"min": 7,
		"max": 8,
		"speed": 240
	},
	"4": {
		"min": 6,
		"max": 7,
		"speed": 260
	},
	"5": {
		"min": 5,
		"max": 6,
		"speed": 280
	},
	"6": {
		"min": 4,
		"max": 5,
		"speed": 300
	},
	"7": {
		"min": 3,
		"max": 4,
		"speed": 320
	},
	"8": {
		"min": 2,
		"max": 3,
		"speed": 340
	},
	"9": {
		"min": 1,
		"max": 2,
		"speed": 360
	},
	"10": {
		"min": 0,
		"max": 1,
		"speed": 380
	}
}

@onready var current_level_key = "1"
var current_level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Current Level: " + current_level_key)
	GameManager.current_level_number = int(current_level_key)
	current_level = levels[current_level_key]
	update_score_label()
	update_level_label()
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func increase_level():
	print("Current Level: " + current_level_key)
	var next_level_key = str(int(current_level_key) + 1)
	if levels.keys().size() <= int(current_level_key):
		print("levels.keys().size(): " + str(levels.keys().size()))
		print("current_level_key: " + current_level_key)
		return

	print("Next Level: " + next_level_key)
	current_level_key = next_level_key
	current_level = levels[next_level_key]
	GameManager.current_level_number = int(current_level_key)


func update_score_label():
	score_label.text = "Score: " + str(score)
	GameManager.high_score = score

func update_level_label():
	level_label.text = "Level: " + str(GameManager.current_level_number)

func incement_score(points):
	score += points
	update_score_label()


func _on_timer_enemy_spawn_time_timeout() -> void:
	increase_level()
	GameManager.min_enemy_spawn_time = max(1, current_level["min"])
	GameManager.max_enemy_spawn_time = max(1, current_level["max"])
	GameManager.wasp_speed = current_level["speed"]
	print("current_level[min]" + str(current_level["min"]))
	print("current_level[max]" + str(current_level["max"]))
	print("GameManager.min_enemy_spawn_time : " + str(GameManager.min_enemy_spawn_time))
	print("GameManager.max_enemy_spawn_time : " + str(GameManager.max_enemy_spawn_time))
	update_level_label()
