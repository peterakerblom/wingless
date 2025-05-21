extends Node2D

var score : int = 0
@onready var score_label = $CanvasLayer/ScoreLabel
@onready var level_label = $CanvasLayer/LevelLabel

@onready var levels = {
	"1": {
		"min": 9,
		"max": 10,
		"speed": 100
	},
	"2": {
		"min": 8,
		"max": 9,
		"speed": 120
	},
	"3": {
		"min": 7,
		"max": 8,
		"speed": 140
	},
	"4": {
		"min": 6,
		"max": 7,
		"speed": 160
	},
	"5": {
		"min": 5,
		"max": 6,
		"speed": 180
	},
	"6": {
		"min": 4,
		"max": 5,
		"speed": 200
	},
	"7": {
		"min": 3,
		"max": 4,
		"speed": 220
	},
	"8": {
		"min": 2,
		"max": 3,
		"speed": 240
	},
	"9": {
		"min": 1,
		"max": 2,
		"speed": 260
	},
	"10": {
		"min": 0,
		"max": 1,
		"speed": 280
	}
}

@onready var current_level_key = "1"
var current_level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.current_level_number = int(current_level_key)
	current_level = levels[current_level_key]
	update_score_label()
	update_level_label()
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func increase_level():
	var next_level_key = str(int(current_level_key) + 1)
	if levels.keys().size() <= int(current_level_key):
		return

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
	update_level_label()
