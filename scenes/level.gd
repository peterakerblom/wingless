extends Node2D

var score : int = 0
@onready var score_label = $CanvasLayer/ScoreLabel
@onready var level_label = $CanvasLayer/LevelLabel

@onready var levels = {
	"1":  {"min": 5.0,    "max": 10.0,  "speed": 100},
	"2":  {"min": 4.555,  "max": 9.0,   "speed": 110},
	"3":  {"min": 4.111,  "max": 8.0,   "speed": 120},
	"4":  {"min": 3.666,  "max": 7.0,   "speed": 130},
	"5":  {"min": 3.222,  "max": 6.0,   "speed": 140},
	"6":  {"min": 2.777,  "max": 5.0,   "speed": 150},
	"7":  {"min": 2.333,  "max": 4.0,   "speed": 160},
	"8":  {"min": 1.888,  "max": 3.0,   "speed": 170},
	"9":  {"min": 1.444,  "max": 2.0,   "speed": 180},
	"10": {"min": 1.0,    "max": 1.0,   "speed": 190},
	"11": {"min": 1.0,    "max": 0.99,  "speed": 200},
	"12": {"min": 0.89,   "max": 0.88,  "speed": 210},
	"13": {"min": 0.78,   "max": 0.77,  "speed": 220},
	"14": {"min": 0.67,   "max": 0.66,  "speed": 230},
	"15": {"min": 0.56,   "max": 0.55,  "speed": 240},
	"16": {"min": 0.45,   "max": 0.44,  "speed": 250},
	"17": {"min": 0.34,   "max": 0.33,  "speed": 260},
	"18": {"min": 0.23,   "max": 0.22,  "speed": 270},
	"19": {"min": 0.12,   "max": 0.11,  "speed": 280},
	"20": {"min": 0.01,   "max": 0.1,   "speed": 290}
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
