extends Resource
class_name PlantData

#enum PowerupType { NONE, SPEED, DOUBLE_GROWTH, EXTRA_POINTS, FREEZE_ENEMIES }

@export var plant_name: String
@export var points: int = 0
@export var pickup_time: float = 0
#@export var powerup: PowerupType = PowerupType.NONE
@export var powerup: Powerup
@export var sprite: Texture2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#func get_powerup_name() -> String:
	#match powerup:
		#PowerupType.NONE: return "None"
		#PowerupType.DOUBLE_GROWTH: return "Double Growth"
		#PowerupType.EXTRA_POINTS: return "Extra Points"
		#PowerupType.FREEZE_ENEMIES: return "Freeze Enemies"
		#_: return "Unknown"
