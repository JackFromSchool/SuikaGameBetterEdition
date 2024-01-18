extends Node

var score

var walls_s
var player_s

func _ready():
	pass

func _process(delta):
	pass

func _on_ui_game_start():
	score = 0
	$Walls.start()
	$Player.start()
	
