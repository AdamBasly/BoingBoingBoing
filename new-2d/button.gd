extends Button

@export var next_scene: String = "res://node_2d.tscn"  # Ziel-Level einstellen

func _ready() -> void:
	connect("pressed", _on_button_pressed)  # Button-Klick registrieren

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(next_scene)  # Szenenwechsel ausführen
