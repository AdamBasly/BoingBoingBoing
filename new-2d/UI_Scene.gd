extends Button

@export var level_path: String  # Level-Pfad direkt im Inspector ändern!

func _ready():
	# **Button deaktivieren, wenn Level nicht geschafft wurde**
	disabled = not Global.completed_levels.has(level_path)

	# **Sich selbst als Scene-Wechsler nutzen**
	pressed.connect(_load_level)

func _load_level():
	if level_path != "":
		get_tree().change_scene_to_file(level_path)
