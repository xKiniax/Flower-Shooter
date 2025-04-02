extends Node2D

@export var zombie_scene : PackedScene
@export var amount_of_zombies = 10

func spawn_zombie():
	var pos = Vector2(randi_range(0, 1920), randi_range(0, 1080))
	var zombie = zombie_scene.instantiate()
	add_child(zombie)
	zombie.global_position = pos

func _ready() -> void:
	for i in 10:
		spawn_zombie()
		
func zombie_killed():
	amount_of_zombies -= 1
	if amount_of_zombies == 0:
		get_tree().change_scene_to_file("res://game_over_screen.tscn")
