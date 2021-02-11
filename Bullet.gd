extends Node2D

# Variables
var direction = Vector2(1, 0)
export var speed = 200

func _ready():
	pass # Replace with function body.


func _process(delta):
	self.position += direction.rotated(self.rotation) * speed * delta
	if ($BulletRayCast.is_colliding()):
		print("Hit!")


func _screen_exited():
	queue_free()
