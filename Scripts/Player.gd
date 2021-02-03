extends KinematicBody2D

export (int) var speed = 4000
var velocity = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	_get_input()
	velocity = move_and_slide(velocity)

func _get_input():
	velocity = Vector2()
	var x_input = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	var y_input = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
	velocity.x += x_input * speed 
	velocity.y += y_input * speed 
