extends CharacterBody2D

@export var is_patrolling : bool = true
@export var ghost_speed: int = 100
@export var is_hunting: bool = false

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var pathfollow = get_parent()

@export var target_to_hunt: CharacterBody2D

func _physics_process(delta):
	if is_patrolling == true:
		pathfollow.progress += ghost_speed * delta
	if is_hunting == true:
		navigation_agent_2d.target_position = target_to_hunt.global_position
		velocity = global_position.direction_to(navigation_agent_2d.get_next_path_position()) * ghost_speed * delta * 100
		move_and_slide()
