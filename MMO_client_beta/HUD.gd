extends CanvasLayer

signal start_game
signal disconnect_from_server
signal clear_globaldictionary

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MessageTimer.stop()
	$MessageLabel.text = "Dodge the\nCreeps!"
	$MessageLabel.show()
	yield(get_tree().create_timer(1), 'timeout')
	emit_signal("clear_globaldictionary")
	#TODO:
	#emit_signal("disconnect_from_server")
	$StartButton.show()
	var tree_root = get_tree().get_root()
	tree_root.get_node("Game/Chat").hide()
	tree_root.get_node("Player").queue_free()
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
	$MessageLabel.hide()

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
