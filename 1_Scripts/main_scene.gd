extends Node2D



var already_started: bool = false



func _process(delta: float) -> void:
	if GlobalVars.is_exorcism_available and !already_started:
		$SpookyAmbience.stop()
		$ExcorcismVibes.start()
		already_started = true
