extends Node2D

func _ready():
	var scene_name = get_tree().current_scene.name  # Name der geladenen Szene holen
	Global.completed_levels[scene_name] = true  # Fortschritt speichern
	print("Level abgeschlossen:", scene_name)  # Debug-Ausgabe
