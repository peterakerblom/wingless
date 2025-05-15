extends Camera2D

var shake_amount = 0.0
var shake_decay = 4.0
var original_position = Vector2.ZERO

func _ready():
	original_position = position

func _process(delta):
	if shake_amount > 0:
		var offset = Vector2(
			randf_range(-shake_amount, shake_amount),
			randf_range(-shake_amount, shake_amount)
		)
		position = original_position + offset
		shake_amount = max(shake_amount - shake_decay * delta, 0)
	else:
		position = original_position

func start_shake(amount):
	shake_amount = amount
