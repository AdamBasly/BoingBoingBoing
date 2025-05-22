extends CharacterBody3D

# Parameter für Flugzeugbewegung
var thrust_power = 50.0
var brake_power = 20.0
var max_speed = 250.0
var drag_coefficient = 0.02
var roll_speed = 0.8
var pitch_speed = 0.5
var yaw_speed = 0.4

var angular_velocity = Vector3.ZERO  # Nur für Rotation

func _process(delta):
	handle_controls(delta)
	apply_physics(delta)

func handle_controls(delta):
	# Schub mit "E"
	if Input.is_action_pressed("e"):
		velocity += transform.basis.z * -thrust_power * delta

	# Bremsen mit "B"
	if Input.is_action_pressed("b"):
		velocity *= 1.0 - (brake_power * delta)

	# Rollbewegung
	if Input.is_action_pressed("ui_left"):
		angular_velocity.z += roll_speed * delta
	if Input.is_action_pressed("ui_right"):
		angular_velocity.z -= roll_speed * delta

	# Höhenrudersteuerung
	if Input.is_action_pressed("w"):
		angular_velocity.x += pitch_speed * delta
	if Input.is_action_pressed("s"):
		angular_velocity.x -= pitch_speed * delta

	# Gieren (Links/Rechts drehen)
	if Input.is_action_pressed("a"):
		angular_velocity.y += yaw_speed * delta
	if Input.is_action_pressed("d"):
		angular_velocity.y -= yaw_speed * delta

func apply_physics(delta):
	# Luftwiderstand anwenden
	velocity *= 1.0 - (drag_coefficient * delta)

	# Geschwindigkeit begrenzen
	velocity = velocity.limit_length(max_speed)

	# Bewegung auf das Flugzeug anwenden
	move_and_slide()

	# Nur rotieren, wenn der Vektor nicht (0, 0, 0) ist
	if angular_velocity.length() > 0.001:  # Minimale Schwelle setzen
		rotate_object_local(angular_velocity.normalized(), delta)

	# Trägheitseffekte für realistische Steuerung
	angular_velocity *= 0.95
