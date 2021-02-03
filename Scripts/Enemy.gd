extends Node2D

# Create an export variable to change in scenes
export(float) var rotate_angle

# Setup variables
var bullet_scene = load("res://Scenes/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(rotate_angle * delta)
	_generate_scene(bullet_scene)

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
	
	var change_x = _random_square_xy()
	var change_y = _random_square_xy()

	instance_scene.position.x += change_x
	instance_scene.position.y += change_y

# Gives the X and Y at random, which are the same, and generates a square
func _random_square_xy():
	return 32*(randf() - 0.5)
