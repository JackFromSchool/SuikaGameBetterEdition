extends CanvasLayer

signal game_start

func _ready():
	for node in get_children():
		node.hide()
	$BackgroundImage.show()

	$GameMusic.play()
	$MainMenu.show()

func _process(delta):
	if $Countdown.visible:
		if Input.is_action_pressed("skip_timer"):
			$Countdown/GameStartTimer.stop()
			$Countdown/GameStartTimer.emit_signal("timeout")
		$Countdown/GameStart.text = str(ceilf($Countdown/GameStartTimer.time_left))

func _on_game_start_pressed():
	$MainMenu.hide()
	$BackgroundImage.hide()
	$Countdown.show()
	$Countdown/GameStartTimer.start()
	
func _on_game_start_2_pressed():
	$MainMenu.hide()
	$BackgroundImage.hide()
	$Countdown.show()
	$Countdown/GameStartTimer.start()
func _on_game_start_timer_timeout():
	$Countdown.hide()
	$HUD.show()
	game_start.emit()

func update_score(score: int):
	$HUD/Score.text = str(score)

func _on_game_over():
	$HUD.hide()
	$Countdown.hide()
	$Endgame.show()



