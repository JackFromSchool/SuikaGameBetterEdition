extends Node

var score = 0

var walls_s
var player_s
var secondCheck = false
var gameOver = false

func _ready():
	pass

func _process(delta):
	pass

func _on_ui_game_start():
	$Walls.start()
	$Player.start()
	

func dualInputDelay(newFruit, body, body2):
	if(!secondCheck):
		secondCheck = true
		if(body.level == 9):
			score = score + 10000
		else:
			add_child(newFruit)
			newFruit.position = body.position
			newFruit.level = body.level + 1
			print(newFruit.level)
			
			print("before: ", score)
			score = score + newFruit.level*1000
			$UI.update_score(score)
			print("after: ", score)
		
		body.queue_free()
		body2.queue_free()
		
		await get_tree().create_timer(0.01).timeout
		secondCheck = false
