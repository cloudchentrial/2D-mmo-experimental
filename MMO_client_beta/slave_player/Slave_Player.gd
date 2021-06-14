extends Area2D

signal hit

export (int) var SPEED
var screensize
var slave_id
var my_player_id = null
onready var tween = get_node("Tween")
var bullet_id_temp = 5

#interpolation
#var past
#var now
#var renderTime#the exact time(in the past) for which we will create a position in this case this is ~1 tick ago
#var t1 = 0# timestamp of a previous position (presumaly one tick older than t2)
#var t2 = 0# timestamp of most recent position update from server
var velocity = Vector2()
var previous_position = Vector2()
var this_position = Vector2()
#var entityInterpolationEnabled = true

func _ready():
	get_node("/root/Game/GlobalDictionary").connect("set_slave_sprite_position_x", self, "set_slave_position_x")
	get_node("/root/Game/GlobalDictionary").connect("set_slave_sprite_position_y", self, "set_slave_position_y")
	get_node("/root/Game/GlobalDictionary").connect("update_slave_sprite_position_x", self, "get_latest_slave_info_x_from_global")
	get_node("/root/Game/GlobalDictionary").connect("update_slave_sprite_position_y", self, "get_latest_slave_info_y_from_global")
	screensize = get_viewport_rect().size
	
	
func _process(delta):
	
	# Map Size Limitations
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	# Movement animated process
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0
	# Trigger animation
	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	#entity interpolation implementation
#	past = 1000/20
#	now = OS.get_system_time_msecs()
#	renderTime = now - past
	
	
	# if we have positional data within this time range
#	if(entityInterpolationEnabled && renderTime <= t2 && renderTime >= t1):
#	# total time from t1 to t2
#		var total = t2 - t1
#		var portion = renderTime - t1
#		print("portion: ", portion)
#
#		var ratio = 1.0 * portion / total
#		print("interpolated ratio: ", ratio)
#		var interpX = lerp(previous_position.x, this_position.x, ratio)
#		var interpY = lerp(previous_position.y, this_position.y, ratio)
#		print("interpolated coordinate : " , "X: " , interpX , " Y: " , interpY)
#		#Tweening between position and interpolated position.
#		var interpVector = Vector2()
#		interpVector.x = interpX
#		interpVector.y = interpY
#		var distance = previous_position.distance_to(this_position)
#		print("Distance: ", distance)
#		var tweenDuration = 1.0 * distance / 400
#		print("tweenDuration: ", tweenDuration)
		
		
#	else:
#		tween.interpolate_property(self, "transform/pos", position, this_position, 0.3, Tween.TRANS_BACK, Tween.EASE_OUT)
		
		
#These functions below will be repeatedly called by GlobalDictionary.
#Update x ,y , per time interval, t2 > t1
func get_latest_slave_info_x_from_global(playerid, latest_pos_x, vel_x):
	if(slave_id == playerid):
		velocity.x = vel_x
		this_position.x = latest_pos_x
		print("get slave player latest x info done!")
	
func get_latest_slave_info_y_from_global(playerid, latest_pos_y, vel_y):
	if(slave_id == playerid):
		velocity.y = vel_y
		this_position.y = latest_pos_y
		#Moved by interpolation.
		tween.interpolate_property(self, "position", position, this_position, 0.18, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween.start()
		print("get slave player latest y info done!")
	
func set_slave_position_x(playerid, setup_pos_x):
	if(slave_id == playerid):
		position.x = setup_pos_x
		print("initialize slave position x done !")
		
func set_slave_position_y(playerid, setup_pos_y):
	if(slave_id == playerid):
		position.y = setup_pos_y
		print("initialize slave position y done !")
		
		
func set_slave_id(playerid):
	slave_id = playerid
	#	group to tag the skills this slave_player do.
	self.add_to_group(slave_id)
	print("Set player id done")
		
func get_slave_id():
	return slave_id
	
#Main Player Info
func set_my_player_id_on_SlavePlayer(playerid):
	my_player_id = playerid
		
#Quit	
func _on_Slave_Player_area_shape_entered(area_id, area, area_shape, self_shape):  # need to rethink
#	bullet_id_temp -= 1
#	print(area_id)
#	print(bullet_id_temp)
	print(area)
	print(is_in_group(slave_id))
	if !area.is_in_group(slave_id):
		queue_free()
	
	
	
	
	
	
	
	
	
