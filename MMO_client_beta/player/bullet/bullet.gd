extends Area2D


var direction = Vector2()
export(float) var SPEED = 200.0
var who_spawn_id

func _ready():
	set_as_toplevel(true)
	self.add_to_group(who_spawn_id)


func _process(delta):
	if is_outside_view_bounds():
		queue_free()
	position += direction * SPEED * delta
	

func is_outside_view_bounds():
	return position.x > OS.get_screen_size().x or position.x < 0.0 \
		or position.y > OS.get_screen_size().y or position.y < 0.0


func _draw():
	draw_circle(Vector2(), $CollisionShape2D.shape.radius, Color('#ffffff'))


func _on_Bullet_area_entered(area):
	if !area.is_in_group(who_spawn_id):
		queue_free()
		print("Collide with slave")
