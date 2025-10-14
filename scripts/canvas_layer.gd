extends CanvasLayer

@onready var container: VBoxContainer = $VBoxContainer4PowerUps

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func add_duration_bar(powerup):
	var bar_scene = preload("uid://cfxyi0iecainm")
	var bar = bar_scene.instantiate()
	container.add_child(bar)
	bar.start(powerup)
	return bar
