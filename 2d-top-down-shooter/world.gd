extends Node2D

@export var zombie_scene : PackedScene
#var zombies_killed 


func spawn_zombie():
	var pos = Vector2(randi_range(0, 1920), randi_range(0, 1080))
	var zombie = zombie_scene.instantiate()
	add_child(zombie)
	zombie.global_position = pos

func _ready() -> void:
	Score.current_score = 0
	for i in 10:
		spawn_zombie()
		
func _process(delta):
	update_score()
	
func update_score():
	Score.previous_score = Score.current_score
	if Score.current_score > Score.high_score:
		Score.high_score = Score.current_score
	


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
	
