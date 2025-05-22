extends CanvasLayer

func _ready():
	visible = false  # UI ist zu Beginn unsichtbar

func _input(event):
	if event.is_action_pressed("ui_cancel"):  # ESC (Standard: "ui_cancel")
		visible = not visible  # Sichtbarkeit umschalten
