extends Node2D

func _ready():
	pass # Replace with function body.


func _process(_delta):
	self.position += Vector2(1, 0).rotated(self.rotation)
	if ($BulletRayCast.is_colliding()):
		print("Hit!")
