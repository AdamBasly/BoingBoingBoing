extends Node

func _ready():
	var current_scene = get_tree().current_scene.name  # Aktuelle Szene holen
	Global.completed_levels[current_scene] = true  # Speichert Level als geschafft
	print("Szene geladen:", current_scene)
