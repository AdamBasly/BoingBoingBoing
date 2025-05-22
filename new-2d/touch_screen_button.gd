extends TouchScreenButton

var move_vector = Vector2.ZERO
@export var player: NodePath  # Referenz zu deinem `CharacterBody2D`
@export var speed: float = 300.0  # Bewegungsgeschwindigkeit

func _process(delta):
	var player_node = get_node_or_null(player)
	if not player_node or not player_node is CharacterBody2D:
		return  # Falls kein Spieler gefunden wird, abbrechen

	# Erhalte analoge Bewegungswerte
	move_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# Setze Spielerbewegung auf Basis des Joystick-Wertes
	player_node.velocity = move_vector * speed
