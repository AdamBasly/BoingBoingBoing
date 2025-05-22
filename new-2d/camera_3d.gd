extends Camera3D

const LOOK_SENSITIVITY = 0.002
const MOVE_SPEED = 5.0
const FAST_MOVE_SPEED = 15.0

var rotation_input = Vector2.ZERO
var is_controlling = false  # Aktiviert, wenn STRG gedrückt wird

func _input(event):
	if event.is_action_pressed("ui_ctrl"):
		is_controlling = true
		Global.is_camera_active = true  # Sperrt Spielersteuerung
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	elif event.is_action_released("ui_ctrl"):
		is_controlling = false
		Global.is_camera_active = false  # Spieler kann wieder laufen
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	# Maussteuerung aktiv, solange STRG gehalten wird
	if is_controlling and event is InputEventMouseMotion:
		rotation_input = event.relative * LOOK_SENSITIVITY

func _process(delta):
	if is_controlling:
		# Kamera drehen
		rotate_x(-rotation_input.y)
		rotate_y(-rotation_input.x)
		rotation_input = Vector2.ZERO  # Reset nach Drehung
		
		# Bewegung mit W, A, S, D
		var move_speed = MOVE_SPEED if not Input.is_action_pressed("ui_shift") else FAST_MOVE_SPEED
		var move_dir = Vector3.ZERO

		if Input.is_action_pressed("ui_up"):  # W
			move_dir -= transform.basis.z  # Nach vorne
		if Input.is_action_pressed("ui_down"):  # S
			move_dir += transform.basis.z  # Nach hinten
		if Input.is_action_pressed("ui_left"):  # A
			move_dir -= transform.basis.x  # Nach links
		if Input.is_action_pressed("ui_right"):  # D
			move_dir += transform.basis.x  # Nach rechts

		if move_dir.length() > 0:
			transform.origin += move_dir.normalized() * move_speed * delta
