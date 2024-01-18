extends Node

var score

var walls_s
var player_s
var secondCheck = false

func _ready():
	pass

func _process(delta):
	pass

func _on_ui_game_start():
	score = 0
	$Walls.start()
	$Player.start()
	

func dualInputDelay(newFruit, body, body2):
	if(!secondCheck):
		secondCheck = true
	
		add_child(newFruit)
		newFruit.position = body.position
		newFruit.level += 1
		
		body.queue_free()
		body2.queue_free()
		
		await get_tree().create_timer(0.1).timeout
		#body.levelUp(body)
		secondCheck = false
