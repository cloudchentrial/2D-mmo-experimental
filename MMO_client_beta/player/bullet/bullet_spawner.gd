extends Node2D

var bullet = preload("Bullet.tscn")


func fire(direction):
	if not $CooldownTimer.is_stopped():
		return
	$CooldownTimer.start()
	var new_bullet = bullet.instance()
	new_bullet.position.x = owner.position.x
	new_bullet.position.y = owner.position.y
	new_bullet.direction = direction
	new_bullet.who_spawn_id = owner.get_my_player_id()
	add_child(new_bullet)


