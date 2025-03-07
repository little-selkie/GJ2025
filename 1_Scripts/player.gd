extends CharacterBody2D

@export var player_speed = 300
@export var acceleration = 10000
@export var friction = 10000

@export var sound_booster = 15
@export var sound_pitcher = 1

@onready var axis = Vector2.ZERO

var was_hit: bool = false
var current_ghosts: Array
var min_distance_to_ghost: float = 0
var ghost_locations: Array

func _ready() -> void:
	get_node("GhostFinder").volume_db = -80
	get_node("GhostFinder").pitch_scale = 0.9

func _physics_process(delta):
	move(delta)
	if len(current_ghosts) == 0:
		get_node("GhostFinder").volume_db = -80
		get_node("GhostFinder").pitch_scale = 0.9
	if len(current_ghosts) != 0:
		var ghost: int = 0
		while (ghost <= len(current_ghosts) - 1):
			ghost_locations[ghost] = global_position.distance_to(current_ghosts[ghost].global_position)
			min_distance_to_ghost = ghost_locations.min()
			print(min_distance_to_ghost)
			ghost += 1
		if min_distance_to_ghost > 10:
			get_node("GhostFinder").volume_db = -20 + (10/min_distance_to_ghost * sound_booster)
			get_node("GhostFinder").pitch_scale = 0.9 + (1/min_distance_to_ghost * sound_pitcher)

func get_input_axis():
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	axis.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	return axis.normalized()

func move(delta):
	axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(friction * delta)
	else:
		apply_movement(axis * acceleration * delta)
	move_and_slide()

func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO

func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(player_speed)

func _on_health_collision_area_entered(area: Area2D) -> void:
	if !was_hit:
		was_hit = true
		if GlobalVars.player_health == 0:
			print("u ded")
		else:
			GlobalVars.player_health -= 1
			print(GlobalVars.player_health)
			if GlobalVars.player_health == 0:
				print("u ded")
	else:
		print("something buggy idk")


func _on_health_collision_area_exited(area: Area2D) -> void:
	was_hit = false


func _on_ghost_finding_area_area_entered(area: Area2D) -> void:
	if len(current_ghosts) == 0:
		get_node("GhostFinder").volume_db = -10
		get_node("GhostFinder").pitch_scale = 0.9
		min_distance_to_ghost = global_position.distance_to(area.global_position)
	current_ghosts.append(area)
	ghost_locations.append(position.distance_to(area.global_position))


func _on_ghost_finding_area_area_exited(area: Area2D) -> void:
	if len(current_ghosts) >= 1:
		current_ghosts.erase(area)
		ghost_locations.slice(-1)
	if len(current_ghosts) == 0:
		get_node("GhostFinder").volume_db = -80
		get_node("GhostFinder").pitch_scale = 0.9
