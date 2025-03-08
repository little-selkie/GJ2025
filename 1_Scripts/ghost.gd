extends CharacterBody2D

@export var is_patrolling : bool = true
@export var in_position : bool = true
@export var ghost_speed: int = 100
@export var is_hunting: bool = false

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var pathfollow = get_parent()

@export var target_to_hunt: CharacterBody2D

var player_in_sight: bool = false
var starting_position: Vector2
var starting_velocity: Vector2
var path_starting_position: Vector2
var already_free: bool = false

var is_fading: bool = false
#var is_appearing: bool = false

func _ready() -> void:
	self.modulate.a = 0
	starting_position = self.global_position
	starting_velocity = velocity
	path_starting_position = pathfollow.global_position
	print(starting_position)
	print(velocity)

func _physics_process(delta):
	if GlobalVars.is_exorcism_available and !already_free:
		self.modulate = 1
		if Input.is_action_pressed("interact") and player_in_sight and !already_free:
			$SoulFreedSound.play()
			$SoulFreed.start()
			GlobalVars.ghosts_freed += 1
			already_free = true
	if is_fading == true:
		if self.modulate.a >= 0:
			self.modulate.a -= 0.005
		else:
			is_fading = false
	#if is_appearing == true:
		#if self.modulate.a < 1:
			#self.modulate.a += 0.01
		#else:
			#is_appearing = false
	if is_patrolling == true and in_position == true and !already_free:
		pathfollow.progress += ghost_speed * delta
	if is_hunting == true and !already_free:
		navigation_agent_2d.target_position = target_to_hunt.global_position
		velocity = global_position.direction_to(navigation_agent_2d.get_next_path_position()) * ghost_speed * delta * 100
		move_and_slide()
	

func _on_vision_area_entered(area: Area2D) -> void:
	#self.modulate.a = 1
	is_fading = false
	$Timer.stop()
	$fading.stop()
	is_hunting = true
	$GhostHunting.play()
	player_in_sight = true
	is_patrolling = false
	in_position = false
	target_to_hunt = area.get_parent()

func _on_vision_area_exited(area: Area2D) -> void:
	$Timer.start()

func _on_timer_timeout() -> void:
	print("can't see")
	print(self.modulate.a)
	$fading.start()
	is_fading = true
	player_in_sight = false
	is_hunting = false
	$GhostHunting.stop()
	$GhostDespawning.play()
	is_patrolling = true


func _on_fading_timeout() -> void:
	self.modulate.a = 0
	pathfollow.global_position = path_starting_position
	self.global_position = starting_position
	velocity = starting_velocity
	pathfollow.progress = 0
	pathfollow.progress_ratio = 0
	in_position = true
	print("return")
	is_fading = false
	self.modulate.a = 0
	#is_appearing = true
