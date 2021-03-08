extends Node2D

# Variables
var direction = Vector2(1, 0)

# Exports
export var speed = 200

func _process(delta):
	self.position += direction.rotated(self.rotation) * speed * delta
	
	if $BulletRayCast.is_colliding():
		var col_obj = $BulletRayCast.get_collider()
		
		if col_obj.type == "PLAYER":
			emit_signal("_changed_health")
			_change_health(col_obj)
			queue_free()

func _change_health(object):
	object.health -= 1

func _screen_exited():
	queue_free()
