extends Node
	
#This node called at the first place when received signal from server
#This only save, update and emit signal to slave instance
	
#new slave scene
#update Slave_Player Scene
signal update_slave_sprite_position_x
signal update_slave_sprite_position_y
signal set_slave_sprite_position_x
signal set_slave_sprite_position_y
	
# Advanced function signal
signal slave_spawn_bullet
	
var slave_player_scene
	
# Called when the node enters the scene tree for the first time.
var slaves_list = []
var slave_info = []
var slave_position_x = {}
var slave_position_y = {}
#var slaveinfo = {
#	player_id1 :{
#		pos : Vector2( 0 , 0)
#	} ,
#	player_id2: {
#		pos: Vector2()
#	}
#}
	
func _ready():
	slave_player_scene = load("res://slave_player/Slave_Player.tscn")
	var HUD_node = get_node("/root/Game/HUD")
	HUD_node.connect("clear_globaldictionary", self, "erase_all_slave_instance")
	print("slave_player_scene load complete")
	
func set_slave_sprite_position_x(playerid, pos_x, mainPlayerid): # set x. (when game begin)
	if(slaves_list.has(playerid)):
		print("ERROR: instance is repeated")
	else:
		new_slave_instance(playerid, mainPlayerid)
	slave_position_x[playerid] = pos_x
	emit_signal("set_slave_sprite_position_x", playerid, pos_x)
	print("set_slave_position_x done")
	
func set_slave_sprite_position_y(playerid, pos_y): # set y. (when game begin)
	slave_position_y[playerid] = pos_y
	emit_signal("set_slave_sprite_position_y", playerid, pos_y)
	print("set_slave_position_y done")
	
func new_slave_instance(playerid, mainPlayerid):  # set slave instance and uuid
	#instancing slave.
	slaves_list.push_back(playerid)
	var slave_player = slave_player_scene.instance()
	get_node("/root/Game/Slaves").add_child(slave_player)
	var tree_root_Slaves = get_node("/root/Game/Slaves")
	tree_root_Slaves.get_child(tree_root_Slaves.get_child_count() -1 ).set_slave_id(playerid)
	tree_root_Slaves.get_child(tree_root_Slaves.get_child_count() -1 ).set_my_player_id_on_SlavePlayer(mainPlayerid)
	print("new slave instance! ")
	
func erase_all_slave_instance():
	print("_erase_all_slave_instance")
	var Slaves_node = get_node("/root/Game/Slaves")
	for player in Slaves_node.get_children():
		player.queue_free()
	slaves_list.clear()
	slave_position_x.clear()
	slave_position_y.clear()
	
func update_slave_sprite_position_x(playerid, pos_x, vel_x):
	slave_position_x[playerid] = pos_x
	emit_signal("update_slave_sprite_position_x", playerid, pos_x, vel_x)
	print("update_slave_sprite_position_x done")
	
func update_slave_sprite_position_y(playerid, pos_y, vel_y):
	slave_position_y[playerid] = pos_y
	emit_signal("update_slave_sprite_position_y", playerid, pos_y, vel_y)
	print("update_slave_sprite_position_y done")
	
func erase_slave_position_x(playerid):
	if(slave_position_x[playerid] != null):
		slave_position_x.erase(playerid)
	else:
		print("Slave you want to erase doesn't exist")
	
func erase_slave_position_y(playerid):
	if(slave_position_y[playerid] != null):
		slave_position_y.erase(playerid)
	else:
		print("Slave you want to erase doesn't exist")
		
		
# Advanced funtion for slave
func slave_spawn_bullet(playerid, direction_x, direction_y):
	emit_signal("slave_spawn_bullet", playerid, direction_x, direction_y)
	print("one slave has spawned bullet")
	
	
	
	
	
	
	
	
	
	
	
	
	
