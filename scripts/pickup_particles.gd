extends Node2D


func _ready():
	await get_tree().process_frame
	$GPUParticles2D.emitting = true
	await get_tree().create_timer($GPUParticles2D.lifetime).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
