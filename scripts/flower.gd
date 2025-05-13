extends Area2D

@export var timer_duration : float = 3.0
@export var point_value : int = 1
var timer : Timer
@onready var level: Node2D = $"../../.."
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var percentage_of_time


signal flower_depleted

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar.visible = false
	timer = $Timer  # Se till att timern är som barn till Area2D
	timer.wait_time = timer_duration
	timer.one_shot = true  # Om du vill att timern ska fortsätta eller inte
	timer.stop()  # Stoppa timern från att börja direktdy.

func _process(delta: float) -> void:
	if not timer.is_stopped():
		if timer.get_time_left() > 0:
			percentage_of_time = (
				(1 - timer.get_time_left() / timer.get_wait_time()) * 100
			)
		progress_bar.value = percentage_of_time

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		progress_bar.visible = true
		timer.start()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		progress_bar.visible = false
		timer.stop()

func _on_timer_timeout() -> void:
	level.incement_score(point_value)
	var popup = preload("uid://mh2tdxx14rx7").instantiate() # point popup
	get_parent().add_child(popup)
	popup.show_popup(self.global_position)
	queue_free()
