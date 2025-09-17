extends Node

var highscores: Array = [] # List with {"score": x, "level": x}

const SAVE_PATH:= "user://highscore.json"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("LOADING SCORES")
	load_scores()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	pass

func add_score(score: int, level: int) -> void:
	highscores.append({"score": score, "level": level})
	highscores.sort_custom(func(a,b): return b["score"] - a["score"])
	if highscores.size() > 10:
		highscores = highscores.slice(0, 10)
	print("💾 Sparar highscores")
	save_scores()

func save_scores() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	
	if file:
		var json_text = JSON.stringify(highscores, "\t")
		file.store_string(json_text)
		file.close()
		print("✅ Fil sparad till:", SAVE_PATH)
	else:
		print("❌ Kunde inte öppna fil för skrivning!")

func load_scores() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		print("LOADING ERROR: No savefile found")
		return
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if not file:
		print("LOADING ERROR: Could not read file")
	var text = file.get_as_text()
	var json = JSON.parse_string(text)
	if typeof(json) != TYPE_ARRAY:
		print("LOADING ERROR: Data is not a TYPED_ARRAY")
	highscores = json
	file.close()
