# Copyright @
extends Node

var score
var player_scene
onready var tree_root = get_tree().get_root()

func _ready():
	tree_root.get_node("Game/Chat").hide()
	player_scene = load("res://player/Player.tscn")
	randomize()

func new_game():
	score = 0
	var player = player_scene.instance()
	tree_root.get_node("Game/Chat").show()
	tree_root.add_child(player)
	var node_player =  tree_root.get_child( tree_root.get_child_count() - 1 )
	var node_client = tree_root.get_child( tree_root.get_child_count() - 1 ).get_node("Client") #get last child.
	#connection of all statement.
	node_client.connect("set_slaves_x", get_node("GlobalDictionary"), "set_slave_sprite_position_x")
	node_client.connect("set_slaves_y", get_node("GlobalDictionary"), "set_slave_sprite_position_y")
	node_client.connect("update_slaves_x", get_node("GlobalDictionary"), "update_slave_sprite_position_x")
	node_client.connect("update_slaves_y", get_node("GlobalDictionary"), "update_slave_sprite_position_y")
	node_client.connect("slaves_chat_log", get_node("Chat"), "_received_slaves_text")
	node_client.connect("slaves_spawn_bullet", get_node("GlobalDictionary"), "slave_spawn_bullet")
	node_player.connect("hit", get_node("HUD"), "show_game_over")
	$StartTimer.start()
	$HUD.show_message("Get Ready")
	$HUD.update_score(score)

func game_over():
	$ScoreTimer.stop()
	$HUD.game_over()
	
func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ENTER:
			if not $Chat/LineEdit.has_focus():
				$Chat/LineEdit.grab_focus()

func _on_StartTimer_timeout():
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
	
