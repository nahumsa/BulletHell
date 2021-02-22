extends Node2D

# Export variables
export(float) var spawn_timer = 2

# Loading Scenes
var enemyFollow_scene = load("res://Scenes/EnemyFollow.tscn")
var enemyRotation_scene = load("res://Scenes/EnemyRotation.tscn")

func _ready():
	
	$"Spawn Timer".set_wait_time(spawn_timer)
	$"Spawn Timer".start()
	

func _spawn_timeout():
	_add_enemy()

func _add_enemy():
	var enemy = enemyFollow_scene.instance()
	randomize()
	enemy.position.x = rand_range(-200, 200)
	add_child(enemy)
