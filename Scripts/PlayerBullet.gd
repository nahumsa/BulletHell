extends Node2D

# Variables
var direction = Vector2(0, -1)

# Exports
export var speed = 200

func _process(delta):
	self.position += direction * speed * delta
	
	# Check Collision
	if $BulletRayCast.is_colliding():
		var col_obj = $BulletRayCast.get_collider()
		print(col_obj)
		if col_obj.type == "ENEMY":
			queue_free()


func _screen_exited():
	queue_free()
