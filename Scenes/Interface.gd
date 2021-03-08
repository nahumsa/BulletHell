extends Control

onready var health_bar = $Healthbar

func update_health(health):
	health_bar.value = health
	
func _on_max_health_updated(max_health):
	health_bar.max_value = max_health

func _on_Player_health_changed(health):
	update_health(health)
