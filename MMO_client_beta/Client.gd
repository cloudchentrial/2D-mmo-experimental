extends Node

var ws = null
const id = null

signal new_slave_instance
signal set_slaves_x
signal set_slaves_y
signal update_slaves_x
signal update_slaves_y
signal erase_slaves_x
signal erase_slaves_y

# Advanced features signal
signal slaves_chat_log
signal slaves_spawn_bullet

func _ready():
	ws = WebSocketClient.new()
	ws.connect("connection_established", self, "_connection_established")
	ws.connect("connection_closed", self, "_connection_closed")
	ws.connect("connection_error", self, "_connection_error")
	
	var url = "ws://localhost:8080/"
	print("Connecting to " + url) 
	ws.connect_to_url(url)

func _connection_established(protocol):
	print("Just connected")
	print("Connection Established With Protocol: ", protocol)

func _connection_closed():
	print("Connection Closed")

func _connection_error():
	print("Connection Error")

func _process(delta):
	if ws.get_connection_status() == ws.CONNECTION_CONNECTING || ws.get_connection_status() == ws.CONNECTION_CONNECTED:
		ws.poll()
	
	if ws.get_peer(1).is_connected_to_host():
#		if Input.is_action_just_released("ui_left"):
#
#		if Input.is_action_just_released("ui_right"):
				
		#receive packet from server.
		if ws.get_peer(1).get_available_packet_count() > 0 :
			var packet = ws.get_peer(1).get_packet()
			var buffer = StreamPeerBuffer.new()
			buffer.set_data_array(packet)
			
			var action = buffer.get_u16()
			print('Receive %s' % action)
			match action:
				1:
					var my_uuid = buffer.get_string()
					print("My id is %s !" % my_uuid)
					get_tree().get_root().get_node("Player").set_my_uuid(my_uuid)
					get_tree().get_root().get_node("Game/Chat").connect("chatText_bc", self, "_on_Player_text_bc")
					_on_Player_join_and_init_server() # send your login info and broadcast to let other client instancing
					_get_slaves_position() # get other players initial info.
				1011:
					var my_player_id = buffer.get_string()
					get_tree().get_root().get_node("Player").set_my_player_id(my_player_id)
					print("My player id is %s !" % my_player_id)
				1012:
					print("We receive OK_GO_RIGHT !")
				1014: # update to Global Dictionary
					print("We receive OK_MOVE_X_AND_BC !")
					var p_id_1014 = buffer.get_string()
					var p_pos_x_1014 = buffer.get_float()
					print("Position X: %f" % [p_pos_x_1014])
					var p_vel_x_1014 = buffer.get_8()
					print("Receive player ID: %s, Position X: %f with velocity: %d" % [p_id_1014, p_pos_x_1014, p_vel_x_1014])
					if(p_id_1014 != get_parent().get_my_player_id()):
						emit_signal("update_slaves_x", p_id_1014, p_pos_x_1014, p_vel_x_1014)
				1015: # update to Global Dictionary
					print("We receive OK_MOVE_Y_AND_BC !")
					var p_id_1015 = buffer.get_string()
					var p_pos_y_1015 = buffer.get_float()
					var p_vel_y_1015 = buffer.get_8()
					print("Receive player ID: %s, Position Y: %f with velocity: %d" % [p_id_1015, p_pos_y_1015, p_vel_y_1015])
					if(p_id_1015 != get_parent().get_my_player_id()):
						emit_signal("update_slaves_y", p_id_1015, p_pos_y_1015, p_vel_y_1015)
				1016:
					print("We receive OK_JOIN_AND_BC !")
					var p_id_1016 = buffer.get_string()
					print("Some one ( maybe you) are broadcasting as ID: %s for joinning the server" % p_id_1016)
					if(p_id_1016 != get_parent().get_my_player_id()):
						print("here is running")
						emit_signal("set_slaves_x", p_id_1016, 200, get_parent().get_my_player_id())  # TODO: 200 might be changed.
						emit_signal("set_slaves_y", p_id_1016, 200)
				1017:  # might be called multiple times. 
					print("We receive OK_GET_SLAVES_X !")
					var p_id_1017 = buffer.get_string()
					var p_pos_x_1017 = buffer.get_float()
					
					if(p_id_1017 != get_parent().get_my_player_id()):
						emit_signal("set_slaves_x", p_id_1017, p_pos_x_1017, get_parent().get_my_player_id())
					
					print("Initialize Slaves Pos X Player Done!")
				1018: # might be called multiple times.
					print("We receive OK_GET_SLAVES_Y !")
					var p_id_1018 = buffer.get_string()
					var p_pos_y_1018 = buffer.get_float()
					
					if(p_id_1018 != get_parent().get_my_player_id()):
						emit_signal("set_slaves_y", p_id_1018, p_pos_y_1018)
					
					print("Initialize Slaves Pos Y Player Done!")
				1019: # init self pos x
					print("We receive OK_INIT_POS_X_AND_BC ! ")
					
				1020: # init self pos y
					print("We receive OK_INIT_POS_X_AND_BC ! ")
					
				1211: # chat text transmission
					print("We receive OK_CHAT_AND_BC ! ")
					var data = buffer.get_utf8_string()
					var array = data.split("`")
					var p_id_1211 = array[0]
					var chatText_1211 = array[1]
					print("Player %s said: %s" % [p_id_1211, chatText_1211])
					if(p_id_1211 != get_parent().get_my_player_id()):
						print(p_id_1211)
						var player_id_get = get_parent().get_my_player_id()
						print(player_id_get)
						print("yes sir.")
						emit_signal("slaves_chat_log", chatText_1211)
				
				1311: # bullet spawn
					print("We receive OK_BULLET_SPAWN !")
					var p_id_1311 = buffer.get_string()
					var slave_bullet_x = buffer.get_8()
					var slave_bullet_y = buffer.get_16()
					if(p_id_1311 != get_parent().get_my_player_id()):
						emit_signal("slaves_spawn_bullet", p_id_1311, slave_bullet_x, slave_bullet_y)
					
				2000: # remove one slave / id info
					if(get_parent() != null):
						print("We receive id: %d SOME_ONE_HAS_DISCONNECTED !", [buffer.get_string()])
						print("Some one has disconnected !")
					
					
func _update_server_player_position_and_velocity(pos, vel):
	var pos_x_vel_x = StreamPeerBuffer.new()
	var pos_y_vel_y = StreamPeerBuffer.new()
	pos_x_vel_x.put_u16(1004)
	pos_x_vel_x.put_float(pos.x)
	pos_x_vel_x.put_8(vel.x)
	pos_y_vel_y.put_u16(1005)
	pos_y_vel_y.put_float(pos.y)
	pos_y_vel_y.put_8(vel.y)
	_sendPacket(pos_x_vel_x.get_data_array())
	_sendPacket(pos_y_vel_y.get_data_array())

func _get_slaves_position():
	var i_want_to_get_slaves_x = StreamPeerBuffer.new()
	var i_want_to_get_slaves_y = StreamPeerBuffer.new()
	i_want_to_get_slaves_x.put_u16(1007)
	i_want_to_get_slaves_y.put_u16(1008)
	_sendPacket(i_want_to_get_slaves_x.get_data_array())
	_sendPacket(i_want_to_get_slaves_y.get_data_array())
	
func _on_Player_join_and_init_server():
	var join = StreamPeerBuffer.new()
	join.put_u16(1006)
	_sendPacket(join.get_data_array())
	var init_self_x = StreamPeerBuffer.new()
	var init_self_y = StreamPeerBuffer.new()
	init_self_x.put_u16(1009)
	init_self_y.put_u16(1010)
	_sendPacket(init_self_x.get_data_array())
	_sendPacket(init_self_y.get_data_array())
	
#Advanced features function.
# Normal Chat
func _on_Player_text_bc(new_text):
	var text = StreamPeerBuffer.new()
	text.put_u16(1201)
	text.put_utf8_string(new_text)
	_sendPacket(text.get_data_array())
	
#DIE
#func _on_Player_hit_update_server():
#	var  i_die_inst = StreamPeerBuffer.new()
#	i_die_inst.put_u16(1202)
#	i_die_inst.
	
# Spawn Bullet
func update_server_spawn_bullet(direction):
	var bullet = StreamPeerBuffer.new()
	bullet.put_u16(1301)
	bullet.put_8(direction.x)
	bullet.put_16(direction.y)
	_sendPacket(bullet.get_data_array())
	
#End up with server


#Trivial function.
func _sendPacket(data):
	ws.get_peer(1).put_packet(data)
	
	
	
	

