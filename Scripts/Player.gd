extends KinematicBody2D

# Variables
var type = "PLAYER"
var velocity = Vector2()
var bullet = load("res://Scenes/PlayerBullet.tscn")

# Export variables
export (int) var speed = 4000
export (int) var health = 5
export (float) var bullet_speed = 10

func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	_get_input_keyboard()
	velocity = move_and_slide(velocity)

func _get_input_mouse():
	look_at(get_global_mouse_position())
	velocity = Vector2()
	if Input.is_action_pressed('ui_up'):
		velocity = Vector2(0, -speed).rotated(rotation)
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2(0, speed).rotated(rotation)

func _get_input_keyboard():
	velocity = Vector2()
	var x_input = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	var y_input = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
	velocity.x += x_input * speed 
	velocity.y += y_input * speed 
	if Input.is_action_just_pressed("ui_accept"):
		_generate_scene(bullet)

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
