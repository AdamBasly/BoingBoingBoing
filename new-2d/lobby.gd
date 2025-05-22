extends Control

@export var ip_field: LineEdit  # IP-Inputfeld
@export var port_field: LineEdit  # Port-Inputfeld

func _on_host_button_pressed():
	var port = port_field.text.to_int()
	GlobalNetwork.start_server(port)

func _on_join_button_pressed():
	var ip = ip_field.text
	var port = port_field.text.to_int()
	GlobalNetwork.join_server(ip, port)
