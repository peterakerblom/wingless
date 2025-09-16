extends Area2D
class_name Plant


@export var timer_duration : float = 3.0
@export var point_value : int = 1
var timer : Timer
@onready var level: Node2D = $"../.."
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var percentage_of_time
@onready var pop_sound = preload("uid://c0mwuklyqwtbf")

var pulse_growing := true

signal flower_depleted

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar.visible = false
	timer = $Timer  # Se till att timern är som barn till Area2D
	timer.wait_time = timer_duration
	timer.one_shot = true  # Om du vill att timern ska fortsätta eller inte
	timer.stop()  # Stoppa timern från att börja direktdy.

func _process(delta: float) -> void:
	if not timer.is_stopped():
		if timer.get_time_left() > 0:
			percentage_of_time = (
				(1 - timer.get_time_left() / timer.get_wait_time()) * 100
			)
		progress_bar.value = percentage_of_time

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		progress_bar.visible = true
		timer.start()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if is_instance_valid(progress_bar):
			progress_bar.visible = false
		timer.stop()

func _on_timer_timeout() -> void:
	level.incement_score(point_value)
	_powerup_increase_player_speed(10.0)
	var popup = preload("uid://mh2tdxx14rx7").instantiate() # point popup
	get_parent().add_child(popup)
	var string_point_value = "+" + str(point_value)
	popup.show_popup(self.global_position, string_point_value)
	_play_pop_sound()
	progress_bar.queue_free()
	_on_pickup()
	play_pop_animation()

func _play_pop_sound():
	var player = AudioStreamPlayer.new()
	player.stream = pop_sound
	player.volume_db = 0
	player.autoplay = false
	get_tree().root.add_child(player)
	player.play()
	player.connect("finished", Callable(player, "queue_free"))

func play_pop_animation():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.4, 1.4), 0.1)\
		 .set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(0, 0), 0.2)\
		 .set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)

	_spawn_particles()
	tween.connect("finished", Callable(self, "_on_pop_animation_finished"))

func _on_pop_animation_finished():
	queue_free()

func _spawn_particles():
	var particles = preload("uid://rq23nfxda4g1").instantiate()
	particles.global_position = self.global_position
	particles.z_index = 999
	get_tree().current_scene.add_child(particles)


func _on_pickup():
	var camera = get_tree().current_scene.get_node("Camera2D")
	if camera:
		camera.start_shake(0.5)


func _powerup_increase_player_speed(value: float):
	PlayerStats.player_speed += value
