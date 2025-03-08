extends Node2D

@onready var transition = $Transition

var already_started: bool = false

func _ready():
	transition.play("fade_in")

func _process(delta: float) -> void:
	if GlobalVars.is_exorcism_available and !already_started:
		$SpookyAmbience.stop()
		$ExcorcismVibes.start()
		already_started = true
