extends Button

@export var port_field: LineEdit  # Verknüpft mit einem Eingabefeld für den Port

func _on_pressed():
	var port = port_field.text.to_int()
	GlobalNetwork.start_server(port)
	print("Server gestartet auf Port:", port)
