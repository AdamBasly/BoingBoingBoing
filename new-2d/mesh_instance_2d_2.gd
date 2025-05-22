extends MeshInstance2D

func _ready():
	if Global.hat_selected:  # Prüft, ob ein Hut gespeichert ist
		mesh = Global.hat_selected  # Setzt den Hut-Mesh
		visible = true  # Aktiviert die Sichtbarkeit
	
