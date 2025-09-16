extends CharacterBody2D


@export var speed: float = PlayerStats.player_speed
@export var acceleration: float = PlayerStats.player_acceleration
@export var friction: float = PlayerStats.player_friction
@export var rotation_speed: float = PlayerStats.player_rotation  # högre = snabbare vridning
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var splat_amin: AnimatedSprite2D = $AnimatedSprite2DSplat
@onready var splat_sound = preload("uid://d36qvsux0m8q")
var can_move: bool = true

signal player_died

func _ready() -> void:
	can_move = true
	animated_sprite_2d.visible = true
	splat_amin.visible = false

func _physics_process(delta: float) -> void:
	if not can_move:
		velocity = Vector2.ZERO
		move_and_slide()
		return
	#look_at(get_global_mouse_position())
	
	# --- Smooth rotation mot musen ---
	var target_angle = (get_global_mouse_position() - global_position).angle()
	rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)

	var move_input = Input.get_axis("move_down", "move_up")
	if move_input:
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")
	var target_velocity = transform.x * move_input * speed
	
	if move_input != 0:
		velocity = velocity.move_toward(target_velocity, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	move_and_slide()
	if speed != PlayerStats.player_speed:
		speed = PlayerStats.player_speed

func take_damage():
	can_move = false
	animated_sprite_2d.visible = false
	splat_amin.visible = true
	_play_splat_sound()
	splat_amin.play("splat")
	await splat_amin.animation_finished
	game_over()

func game_over():
	emit_signal("player_died")
	queue_free()
	var game_over_scene = preload("res://scenes/game_over.tscn").instantiate()
	get_tree().current_scene.add_child(game_over_scene)

func _play_splat_sound():
	var player = AudioStreamPlayer.new()
	player.stream = splat_sound
	player.volume_db = 0
	player.autoplay = false
	get_tree().root.add_child(player)
	player.play()
	player.connect("finished", Callable(player, "queue_free"))
