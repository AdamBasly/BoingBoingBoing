extends Node

var hat_selected: Mesh = null  # Speichert den Hut
var skin_selected: String = ""  # Speichert die Skin
var player: NodePath = NodePath("")  # Leerer `NodePath`, verhindert Fehler
var is_camera_active = false  # Blockiert die Spielerbewegung, wenn Kamera aktiv ist
var completed_levels = {}  # Speichert abgeschlossene Level

func mark_level_completed(level_path: String):
	completed_levels[level_path] = true
