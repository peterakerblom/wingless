extends Control

@onready var bar: ProgressBar = $ProgressBar
@onready var label: Label = $Label

var duration := 1.0
var time_left := 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if time_left > 0:
		time_left -= delta
		bar.value = time_left
		if time_left <= 0:
			queue_free()

func start(powerup_name: String, duration_value: float):
	duration = duration_value
	time_left = duration
	label.text = powerup_name
	bar.max_value = duration
	bar.value = duration
	show()
