extends CharacterBody2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D

@export var move_speed = 100
@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("player")
@onready var alive_zombie_pics = [preload("res://assets/flower weed 1.png"), preload("res://assets/flower weed 2.png"), preload("res://assets/flower weed 3.png")]
@onready var dead_zombie_pics = [preload("res://assets/sunflower.png"), preload("res://assets/dead_body.png"), preload("res://assets/Blue flowers.png"), preload("res://assets/pink sakura flower.png")]


var dead = false

func _ready() -> void:
	$Graphics/Alive.texture = alive_zombie_pics.pick_random()
	$Graphics/Dead.texture = dead_zombie_pics.pick_random()


func _physics_process(delta: float) -> void:
	
	if dead:
		return
		
	print(player)
	var dir_to_player = global_position.direction_to(player.global_position)
	velocity = dir_to_player * move_speed
	move_and_slide()
	
	look_at(player.global_position)
	#global_rotation - dir_to_player.angle() + PI/2.0
	
	if ray_cast_2d.is_colliding() and ray_cast_2d.get_collider() == player:
		player.kill()

func kill():
	if dead:
		return
	dead = true
	$DeathSound.play()
	$Graphics/Dead.show()
	$Graphics/Alive.hide()
	$CollisionShape2D.disabled = true
	z_index = -1
	#get_parent().zombie_killed()
	get_parent().zombie_number += 1
