extends Control

@export var ip_field: LineEdit  # Eingabefeld für IP-Adresse
@export var port_field: LineEdit  # Eingabefeld für Port
@export var status_label: Label  # Statusanzeige für Verbindung

func _on_host_button_pressed():
	var port = port_field.text.to_int()
	GlobalNetwork.start_server(port)
	status_label.text = "Server gestartet auf Port " + str(port)

func _on_join_button_pressed():
	var ip = ip_field.text
	var port = port_field.text.to_int()
	GlobalNetwork.join_server(ip, port)
	status_label.text = "Verbinde mit " + ip + ":" + str(port)
