extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const MAX_AIR_JUMPS = 2
const SLIDE_FRICTION = 0.08
const AIR_CONTROL = 0.6

var air_jumps = 0

@rpc("any_peer")  # Ermöglicht Synchronisation zwischen Client & Server
func sync_movement(new_position, new_velocity):
	position = new_position
	velocity = new_velocity

func _physics_process(delta: float) -> void:
	if not is_multiplayer_authority():  # Nur der Besitzer steuert sich selbst
		return

	# Schwerkraft hinzufügen
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	else:
		air_jumps = 0  # Airhop zurücksetzen

	# Sprünge handhaben
	if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or air_jumps < MAX_AIR_JUMPS):
		velocity.y = JUMP_VELOCITY
		if not is_on_floor():
			air_jumps += 1

	# Bewegung mit Sliding & Air-Control
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
		if not is_on_floor():
			velocity.x *= AIR_CONTROL
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * SLIDE_FRICTION)

	move_and_slide()

	# **Synchronisiere Position & Geschwindigkeit für alle Spieler**
	rpc("sync_movement", position, velocity)
