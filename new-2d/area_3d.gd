extends Area3D

@export var next_level: String = "res://winlevel_4.tscn"  # Hier Level-Pfad anpassen

func _ready() -> void:
	connect("body_entered", _on_body_entered)  # Ereignis für Kollision verbinden

func _on_body_entered(body):
	if body is CharacterBody3D:  # Prüft auf 3D-Spieler
		get_tree().change_scene_to_file(next_level)  # Lade das neue Level
