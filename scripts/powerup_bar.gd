extends Control

signal expired(powerup)

@onready var bar: ProgressBar = $ProgressBar
@onready var texture_rect: TextureRect = $ProgressBar/HBoxContainer/TextureRect
@onready var label: Label = $ProgressBar/HBoxContainer/Label

var duration := 1.0
var time_left := 1.0
var active_powerup = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if time_left > 0:
		time_left -= delta
		bar.value = time_left
		if time_left <= 0:
			emit_signal("expired", active_powerup)
			queue_free()

func start(powerup: Powerup): # , duration_value: float
	active_powerup = powerup
	texture_rect.texture = powerup.icon
	duration = powerup.powerup_duration
	time_left = duration
	label.text = powerup.powerup_name
	print(powerup.powerup_name)
	bar.max_value = duration
	bar.value = duration
	show()
	set_process(true)
