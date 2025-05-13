extends Node2D

var score : int = 0
@onready var score_label = $CanvasLayer/ScoreLabel

@onready var levels = {
	"1": {
		"min": 5,
		"max": 10,
		"speed": 200,
	},
	"2": {
		"min": 4,
		"max": 9,
		"speed": 220,
	},
	"3": {
		"min": 3,
		"max": 8
	},
	"4": {
		"min": 2,
		"max": 7
	},
	"5": {
		"min": 1,
		"max": 6
	}
}

@onready var current_level = "1"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Current Level: " + current_level)
	update_score_label()
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func increase_level():
	print("Current Level: " + current_level)
	var next_level_key = str(int(current_level) + 1)
	if levels.keys().size() <= int(current_level):
		print("levels.keys().size(): " + str(levels.keys().size()))
		print("current_level: " + current_level)
		return

	var next_level = levels[next_level_key]
	print("Next Level: " + next_level_key)
	current_level = next_level_key
	
	#var level_keys = levels.keys()
	#level_keys.sort()
	#var index = level_keys.find(current_level)
	#print("index: " + index.key)
#
	#if int(index.key) >= 0 and int(index.key) + 1 < level_keys.size():
		#var current_level = level_keys[int(index.key) + 1]
		#print("Nästa nivå är:", current_level)
	#else:
		#print("Ingen nästa nivå!")
	#pass
	

func update_score_label():
	score_label.text = "Score: " + str(score)
	GameManager.high_score = score

func incement_score(points):
	score += points
	update_score_label()


func _on_timer_enemy_spawn_time_timeout() -> void:
	increase_level()
	GameManager.min_enemy_spawn_time = max(1, GameManager.min_enemy_spawn_time - 1)
	GameManager.max_enemy_spawn_time = max(1, GameManager.max_enemy_spawn_time - 1)
	print("GameManager.min_enemy_spawn_time : " + str(GameManager.min_enemy_spawn_time))
	print("GameManager.max_enemy_spawn_time : " + str(GameManager.max_enemy_spawn_time))
