extends Button

@export var hat_mesh: Mesh  # Hut-Mesh
@export var player: NodePath  # Verknüpfung zu `CharacterBody2D`

func _on_button_pressed():
	var player_node = get_node_or_null(player)
	if player_node:
		var hat = player_node.get_node_or_null("HatMesh")
		if hat:
			hat.mesh = hat_mesh
			hat.visible = true  # Zeigt den Hut an

			# Speichert den Hut global
			Global.hat_selected = hat_mesh
