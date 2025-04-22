extends Area2D

@export var timer_duration : float = 3.0
@export var point_value : int = 1
var timer : Timer
@onready var level: Node2D = $"../../.."


signal flower_depleted

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $Timer  # Se till att timern är som barn till Area2D
	timer.wait_time = timer_duration
	timer.one_shot = true  # Om du vill att timern ska fortsätta eller inte
	timer.stop()  # Stoppa timern från att börja direktdy.

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print(body.name + " enters area")
		timer.start()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print(body.name + " leaves area")
		timer.stop()

func _on_timer_timeout() -> void:
	print("Timern har löpt ut!")
	level.incement_score(point_value)
	queue_free()
