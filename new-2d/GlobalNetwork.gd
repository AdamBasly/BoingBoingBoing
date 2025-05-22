extends Node

var peer = null
var is_server = false

func start_server(port):
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(port, 2)  # Max. 2 Spieler
	if error != OK:
		print("Fehler beim Starten des Servers:", error)
		return
	get_tree().set_multiplayer_peer(peer)
	is_server = true
	print("Server läuft auf Port:", port)

func join_server(ip, port):
	peer = ENetMultiplayerPeer.new()
	var error = peer.create_client(ip, port)
	if error != OK:
		print("Fehler beim Verbinden:", error)
		return
	get_tree().set_multiplayer_peer(peer)
	is_server = false
	print("Verbunden mit Server:", ip, "Port:", port)
