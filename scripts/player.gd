extends CharacterBody2D


@export var speed = 200.0


func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	var move_input = Input.get_axis("move_down", "move_up")
	velocity = transform.x * move_input * speed
	move_and_slide()

func take_damage():
	print("Spelaren tog skada")
	game_over()

func game_over():
	queue_free()
	var game_over_scene = preload("res://scenes/game_over.tscn").instantiate()
	get_tree().current_scene.add_child(game_over_scene)
