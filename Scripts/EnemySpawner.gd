extends Node2D

# Export variables
export(float) var spawn_timer = 5

# Loading Scenes
var enemyFollow_scene = load("res://Scenes/EnemyFollow.tscn")
var enemyRotation_scene = load("res://Scenes/EnemyRotation.tscn")
var enemies = [enemyFollow_scene, enemyRotation_scene]

func _ready():
	$"Spawn Timer".set_wait_time(spawn_timer)
	$"Spawn Timer".start()

func _spawn_timeout():
	_add_enemy()

func _add_enemy():
	randomize()
	var choice_enemy = enemies[randi() % enemies.size()]
	var enemy = choice_enemy.instance()
	enemy.position.x = rand_range(-200, 200)
	add_child(enemy)
