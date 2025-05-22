extends Area2D  # Ändere von CollisionShape2D zu Area2D für Kollisionserkennung

signal player_respawn  # Signal für das Respawn-Event

# Setze die Respawn-Position
@export var respawn_position: Vector2 = Vector2(573, 313)  # Wo der Spieler hin teleportiert wird

func _ready() -> void:
	connect("body_entered", _on_body_entered)  # Verbindung mit Kollisionserkennung

# Wird aufgerufen, wenn ein Körper die Zone betritt
func _on_body_entered(body):
	if body is CharacterBody2D:
		body.position = respawn_position  # Teleportiere den Spieler zur Respawn-Position
