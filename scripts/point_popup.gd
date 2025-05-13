extends Control

@onready var label = $Label
@onready var tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_popup(pos: Vector2, text: String = "+1"):
	tween = get_tree().create_tween()
	label.text = text
	global_position = pos

	# Startposition och målposition
	var start_pos = position
	var end_pos = start_pos + Vector2(0, -30)  # rör sig uppåt

	# Fadear ut genom modulate alpha
	modulate.a = 1.0

	# Kör tween för position
	tween.tween_property(self, "position", end_pos, 0.6).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

	# Kör tween för alpha
	tween.tween_property(self, "modulate:a", 0.0, 0.6).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)

	# Ta bort popup när tween är klar
	await tween.finished
	queue_free()
