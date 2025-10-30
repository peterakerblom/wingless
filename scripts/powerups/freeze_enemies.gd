extends Powerup
class_name FreezeEnemies

func apply(target: Node):
	_freeze_enemies(target)

func remove(target: Node):
	_unfreeze_enemies(target)
	
func _freeze_enemies(target):
	print("Enemies frozen for seconds!")
	var tree = target.get_tree()
	if not tree:
		push_warning("FreezeEnemies: target has no SceneTree")
		return

	var enemies = tree.get_nodes_in_group("Enemies")
	for enemy in enemies:
		if enemy.has_method("freeze"):
			enemy.freeze()

	var spawns = tree.get_nodes_in_group("Spawns")
	for spawn in spawns:
		var timer: Timer = spawn.get_node("Timer")
		timer.set_paused(true)


func _unfreeze_enemies(target: Node):
	var tree = target.get_tree()
	if not tree:
		return

	var enemies = tree.get_nodes_in_group("Enemies")
	for enemy in enemies:
		if enemy.has_method("unfreeze"):
			enemy.unfreeze()

	var spawns = tree.get_nodes_in_group("Spawns")
	for spawn in spawns:
		var timer: Timer = spawn.get_node("Timer")
		timer.set_paused(false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
