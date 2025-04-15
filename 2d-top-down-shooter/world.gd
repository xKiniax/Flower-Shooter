extends Node2D

@export var zombie_scene : PackedScene
#var zombies_killed 
var zombie_number = 0

func spawn_zombie():
	var pos = Vector2(randi_range(0, 1920), randi_range(0, 1080))
	var zombie = zombie_scene.instantiate()
	add_child(zombie)
	zombie.global_position = pos

func _ready() -> void:
	for i in 10:
		spawn_zombie()
		


func _on_timer_timeout() -> void:
	#amount_of_zombies -= 1
	#if amount_of_zombies == 0:
		#get_tree().change_scene_to_file("res://you_won.tscn")
	#else:
	get_tree().change_scene_to_file("res://game_over_screen.tscn")
	

func _on_zombie_spawning_timeout() -> void:
	for i in 10:
		spawn_zombie()
	$"Zombie spawning".start()
	
