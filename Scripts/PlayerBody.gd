extends KinematicBody2D

export (int) var speed = 200
var velocity = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	_get_input()
	velocity = move_and_slide(velocity)

func _get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
