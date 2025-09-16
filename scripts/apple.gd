extends Area2D

@onready var apple_sprite: Sprite2D = $Sprite2D
@onready var apple_collisionshape: CollisionShape2D = $CollisionShape2D
@onready var landing_sound = preload("res://assets/sound/landing_sound.wav")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apple_sprite.position.y = -1000
	var fall_tween = get_tree().create_tween()
	fall_tween.tween_property(apple_sprite, "position", Vector2(0.0, 0.0), 3.0)
	fall_tween.finished.connect(_on_tween_finished)
	
func _on_tween_finished():
	var roll_distance = 700.0
	var rotate_value = 30.0
	var roll_right = randf() < 0.5
	if not roll_right:
		roll_distance = position.x + (roll_distance * -1)
		rotate_value = rotate_value * -1
	apple_collisionshape.disabled = false
	_juice_on_landing()
	var roll_tween = get_tree().create_tween()
	var move_tween = get_tree().create_tween()
	roll_tween.tween_property(apple_sprite, "rotation", rotate_value, 30.0)
	move_tween.tween_property(self, "position", Vector2(roll_distance, position.y), 30.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.take_damage()

func _juice_on_landing():
	_play_landing_sound()
	var camera = get_tree().current_scene.get_node("Camera2D")
	if camera:
		camera.start_shake(0.5)

func _play_landing_sound():
	var player = AudioStreamPlayer.new()
	player.stream = landing_sound
	player.volume_db = 0
	player.autoplay = false
	get_tree().root.add_child(player)
	player.play()
	player.connect("finished", Callable(player, "queue_free"))
