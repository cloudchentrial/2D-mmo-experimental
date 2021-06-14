extends Area2D

signal hit
signal hit_update_server
signal update_server

#Player FSM
#signal state_changed
#signal direction_changed(new_direction)
var velocity = Vector2()
var bullet_direction = Vector2(1, 0)
#var states_stack = []
#var current_state = null
#
#onready var states_map = {
#	"idle": $States/Idle,
#	"move": $States/Move
#}

export (int) var SPEED
var screensize

#Server Update 
var updateServerTimer = 0.2 # i.e. update 5 times per second.
var updateServerCycle = 0.2
var last_update_pos = Vector2()
var update_server_velocity = Vector2()
var last_update_velocity = Vector2()
var my_player_id
var my_uuid
var player_control_enabled = true


func _ready():
	start($StartPosition.position)
	screensize = get_viewport_rect().size
	
#	for state_node in $States.get_children():
#		state_node.connect("finished", self, "_change_state")
#
#	states_stack.push_front($States/Idle)
#	current_state = states_stack[0]
#	_change_state("idle")

func _process(delta):
	velocity = Vector2()
	if player_control_enabled == true:
		if Input.is_action_pressed("ui_right"):
			velocity.x += 1
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 1
		if Input.is_action_pressed("ui_down"):
			velocity.y += 1
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1
		if Input.is_action_pressed("fire"):
			$Client.update_server_spawn_bullet(bullet_direction)
			$BulletSpawn.fire(bullet_direction)
			
	if velocity.length() > 0:
		update_server_velocity = velocity
		print(update_server_velocity)
		$AnimatedSprite.play()
		velocity = velocity.normalized() * SPEED
	else:
		$AnimatedSprite.stop()
	
	#update master param.
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	#movement animations and bullet direction decision
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
		if($AnimatedSprite.flip_h == true):
			bullet_direction.x = -1
		else:
			bullet_direction.x = 1
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0
	
	#update to server when i move with limited emission.
	if velocity.x != 0 || velocity.y != 0: # has moved
		updateServerTimer += delta
		
		if(updateServerTimer > updateServerCycle):
			updateServerTimer -= updateServerCycle
			print("velocity x: %f" % update_server_velocity.x)
			print("velocity y: %f" % update_server_velocity.y)
			emit_signal("update_server", position, update_server_velocity)
			last_update_pos = position
			last_update_velocity = update_server_velocity
	else:
		updateServerTimer = 0.19
		if(last_update_pos != position || last_update_velocity != Vector2()):
			last_update_pos = position
			last_update_velocity = Vector2()
			emit_signal("update_server", last_update_pos, last_update_velocity)
			
#Function of FSM
#func _change_state(state_name):
#	current_state.exit()  #leave current state
#	if state_name == "previous":
#		states_stack.pop_front()
#	elif state_name == "dead":
#		queue_free()
#		return
#	else:
#		var new_state = states_map[state_name]
#		states_stack[0] = new_state
#
#	current_state = states_stack[0]
#	if state_name != "previous":
#		# it is unneccessary to reinitialize the state if we're going back to the previous state
#		current_state.enter()
#	emit_signal("state_changed", states_stack)

func _on_Player_area_entered(area):  #player has beened collided
	print("hit by bullet")
	hide()
	emit_signal("hit")
	emit_signal("hit_update_server")
	$CollisionShape2D.call_deferred("set_disabled", true)
	
func set_my_uuid(playerid):
	my_uuid = playerid
	print("Set my id done.")
	
func set_my_player_id(playerid):
	my_player_id = playerid
	self.add_to_group(my_player_id)
	print("Set my player id done.")
	
func get_my_player_id():
	return my_player_id
	
func start(pos):
	position = pos
	
func set_player_control(value: bool):
	player_control_enabled = value
	
