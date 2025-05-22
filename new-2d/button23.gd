extends Button

@export var ip_field: LineEdit  # Eingabefeld für IP-Adresse
@export var port_field: LineEdit  # Eingabefeld für Port
@export var status_label: Label  # Statusanzeige für Verbindung

func _on_pressed():
	var ip = ip_field.text
	var port = port_field.text.to_int()
	
	if ip.is_empty() or port <= 0:
		status_label.text = "Ungültige IP oder Port!"
		return

	GlobalNetwork.join_server(ip, port)
	status_label.text = "Verbinde mit " + ip + ":" + str(port)
