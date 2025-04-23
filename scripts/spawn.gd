extends StaticBody2D

var timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $Timer
	timer.one_shot = false  # Så att timern fortsätter återkomma
	timer.start()  # Starta timern direkt


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	pass # Replace with function body.
