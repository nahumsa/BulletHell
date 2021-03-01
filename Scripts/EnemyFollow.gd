extends Node2D

# Setup variables
var type = "ENEMY"
var bullet_scene = load("res://Scenes/Bullet.tscn")

# Create an export variable to change in scenes
export(float) var rotate_angle
export(float) var bullet_timer = 2
export(float) var y_velocity = 3

func _ready():
	$"Add bullet timer".set_wait_time(bullet_timer)
	$"Add bullet timer".start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	rotate(rotate_angle * delta)
	_movement(delta)
	
func _movement(delta):
	self.position.y += y_velocity * delta
	
# This generates a scene
func _generate_scene(scene):
	
	# Instance the scene
	var scene_instance = scene.instance()
	
	# Change the position
	_change_position_bullet(scene_instance)
	
	# Add to the main scene
	get_parent().add_child(scene_instance)

# Changes the position of the bullet
func _change_position_bullet(instance_scene):
	instance_scene.position = self.position 
	instance_scene.rotation = self.rotation
	
	_follow_player(instance_scene)
	
func _follow_player(instance_scene):
	var player_position = get_parent().get_parent().get_node("Player").position
	var player_direction = (player_position - self.global_position).normalized()
	instance_scene.direction = player_direction
	
	
func _timeout():
	_generate_scene(bullet_scene)

func _screen_exited():
	queue_free()
