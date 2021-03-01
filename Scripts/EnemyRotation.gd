extends Node2D

# Variables
var bullet_scene = load("res://Scenes/Bullet.tscn")

# Export variables
export(float) var rotate_angle
export(int) var n_bullets = 1
export(float) var bullet_timer = 2
export(float) var y_velocity = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Add Bullet Timer".set_wait_time(bullet_timer)
	$"Add Bullet Timer".start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(rotate_angle * delta)
	_movement(delta)

func _movement(delta):
	self.position.y += y_velocity * delta

# This generates a scene
func _generate_scene(scene, index=0):
	
	# Instance the scene
	var scene_instance = scene.instance()
	
	# Change the position
	_change_position_bullet(scene_instance, index)
	
	# Add to the main scene
	get_parent().add_child(scene_instance)

# Changes the position of the bullet
func _change_position_bullet(instance_scene, index, change=false):
	instance_scene.position = self.position 
	instance_scene.rotation = self.rotation
	
	_apply_direction(instance_scene, index)
	
	if change:
		var change_x = _random_square_xy()
		var change_y = _random_square_xy()

		instance_scene.position.x += change_x
		instance_scene.position.y += change_y

func _apply_direction(instance_scene, index):
	
	if index == 1:
		instance_scene.direction = Vector2(0, 1)
		
	elif index == 2:
		instance_scene.direction = Vector2(-1, 0)
	
	elif index == 3:
		instance_scene.direction = Vector2(0, -1)

# Gives the X and Y at random, which are the same, and generates a square
func _random_square_xy():
	return 32*(randf() - 0.5)

func _timeout():
	for index in range(n_bullets):
		_generate_scene(bullet_scene, index)


func _screen_exited():
	queue_free()
