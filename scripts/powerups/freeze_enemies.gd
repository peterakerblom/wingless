extends Powerup
class_name FreezeEnemies

#@export var duration: float = 3.0

func apply(target: Node):
	_freeze_enemies(target)
	# Här kan du signalera eller kalla en EnemyManager

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
	#var level = get_tree().get_first_node_in_group("Levels")
		
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
