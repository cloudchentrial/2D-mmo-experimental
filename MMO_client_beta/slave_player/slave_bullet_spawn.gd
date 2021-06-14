extends Node2D
	
var bullet = preload("res://slave_player/bullet/Slave_Bullet.tscn")  # TODO: Might need to customzie for slave
	
func _ready():
	get_tree().get_root().get_node("Game/GlobalDictionary").connect("slave_spawn_bullet", self, "slave_spawn_bullet")
	
func slave_spawn_bullet(playerid, direction_x, direction_y):
	var direction = Vector2()
	direction.x = direction_x
	direction.y = direction_y
	if(owner.get_slave_id() == playerid):
		fire(direction)
		print("slave has fired ! ")
		
		
func fire(direction):
	if not $CooldownTimer.is_stopped():
		return
	$CooldownTimer.start()
	var new_bullet = bullet.instance()
#	new_bullet.Slave_Player_Area_ID = get_parent().get_node("CollisionShape2D").get_instance_id() - 2
#	get_parent().bullet_id_temp = new_bullet.get_node("CollisionShape2D").get_instance_id()
	
#	Bullet properties setting.
	new_bullet.position.x = owner.position.x
	new_bullet.position.y = owner.position.y
	new_bullet.direction = direction
	new_bullet.who_spawn_id = owner.get_slave_id()
	add_child(new_bullet)
	
#	var tree_root = get_tree().get_root()
#	var node_bullet =  tree_root.get_child( tree_root.get_child_count() - 1 )
#	get_parent().bullet_id_ram = node_bullet.get_node("CollisionShape2D").get_instance_id()
	
# TODO: might need to seperate bullet spawn and slave player when implement visibility range section loading system.