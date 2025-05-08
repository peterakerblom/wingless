extends Node2D

var score : int = 0
@onready var score_label = $CanvasLayer/ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_score_label()
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_score_label():
	score_label.text = "Score: " + str(score)
	GameManager.high_score = score

func incement_score(points):
	score += points
	update_score_label()
