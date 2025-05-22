extends TextureButton

var joystick_center = Vector2.ZERO
var move_vector = Vector2.ZERO
var jump_pressed = false  # Speichert, ob gesprungen wird

@export var max_range: float = 50.0  # Maximale Bewegung des Sticks
@export var player: NodePath  # Verknüpfung mit `CharacterBody2D`

func _ready():
	joystick_center = position  # Speichere die zentrale Position

func _process(delta):
	var player_node = get_node(player)  # Hole den Charakter
	if not player_node or not player_node is CharacterBody2D:
		return  # Falls kein Spieler gefunden wird, abbrechen

	if Input.is_action_pressed("touch"):  # Falls gedrückt
		var touch_pos = get_global_mouse_position()
		var offset = touch_pos - joystick_center

		# Begrenzung der Bewegung
		if offset.length() > max_range:
			offset = offset.normalized() * max_range

		position = joystick_center + offset
		move_vector = offset / max_range  # Wert von -1 bis 1

		# Steuerung für den Spieler übernehmen
		player_node.velocity.x = move_vector.x * 300  # Geschwindigkeit setzen
		if move_vector.y < -0.5 and not jump_pressed:
			player_node.velocity.y = -400  # Sprung auslösen
			jump_pressed = true
	else:
		position = joystick_center  # Zurück zur Mitte
		move_vector = Vector2.ZERO
		player_node.velocity.x = 0  # Bewegung stoppen
		jump_pressed = false  # Sprung zurücksetzen
