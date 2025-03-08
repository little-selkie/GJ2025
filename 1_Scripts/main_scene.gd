extends Node2D

@onready var pause_menu = $UI/PauseMenu

var already_started: bool = false
var paused = false


func _process(delta: float) -> void:
	if GlobalVars.is_exorcism_available and !already_started:
		$Player/SpookyAmbience.stop()
		$Player/ExcorcismVibes.play()
		already_started = true
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
	
