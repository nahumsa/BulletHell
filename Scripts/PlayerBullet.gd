extends Node2D

# Variables
var direction = Vector2(1, 0)

# Exports
export var speed = 200

func _ready():
	pass 

func _process(delta):
	self.position += direction.rotated(self.rotation) * speed * delta
	if $BulletRayCast.is_colliding():
		var col_obj = $BulletRayCast.get_collider().get_parent().get_node()
		if col_obj.type == "ENEMY":
			queue_free()


func _screen_exited():
	queue_free()
