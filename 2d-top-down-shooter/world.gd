extends Node2D

@export var zombie_scene : PackedScene

func spawn_zombie():
	var pos = Vector2(randi_range(0, 1920), randi_range(0, 1080))
	var zombie = zombie_scene.instantiate()
	add_child(zombie)
	zombie.global_position = pos

func _ready() -> void:
	for i in 10:
		spawn_zombie()
