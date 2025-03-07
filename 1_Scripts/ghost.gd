extends Node2D

@export var is_patrolling : bool = true
@export var ghost_speed: int = 100

@onready var pathfollow = get_parent()

func _physics_process(delta):
	if is_patrolling == true:
		pathfollow.progress += ghost_speed * delta
