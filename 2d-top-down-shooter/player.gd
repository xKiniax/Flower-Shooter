extends CharacterBody2D


@onready var ray_cast_2d: RayCast2D = $RayCast2D
@export var move_speed = 200

var dead = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	if Input.is_action_just_pressed("restart"):
		restart()
	if dead:
		return
		
	global_rotation = global_position.direction_to(get_global_mouse_position()).angle() * PI/2.0
		
func restart():
	get_tree().reload_current_
