extends CanvasLayer

signal game_start

func _ready():
	for node in get_children():
		node.hide()
	
	$MainMenu.show()

func _process(delta):
	pass

func _on_game_start_pressed():
	game_start.emit()
	$MainMenu.hide()
