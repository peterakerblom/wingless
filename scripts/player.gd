extends CharacterBody2D


@export var speed = 100.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	var move_input = Input.get_axis("move_down", "move_up")
	if move_input:
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")
	velocity = transform.x * move_input * speed
	move_and_slide()

func take_damage():
	game_over()

func game_over():
	queue_free()
	var game_over_scene = preload("res://scenes/game_over.tscn").instantiate()
	get_tree().current_scene.add_child(game_over_scene)
