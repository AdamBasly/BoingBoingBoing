extends Area2D

@export var next_level: String = "res://level_2.tscn"  # Hier Level-Pfad anpassen

func _ready() -> void:
	connect("body_entered", _on_body_entered)  # Ereignis für Kollision verbinden

func _on_body_entered(body):
	if body is CharacterBody2D:
		get_tree().change_scene_to_file(next_level)  # Lade das neue Level
