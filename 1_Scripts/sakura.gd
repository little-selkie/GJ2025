extends StaticBody2D

var is_player_here: bool = false
var timer_started: bool = false

func _process(delta: float) -> void:
	if is_player_here and GlobalVars.player_health < 10 and !timer_started:
		$HealthTimer.start()
		timer_started = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	is_player_here = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	is_player_here = false


func _on_health_timer_timeout() -> void:
	if GlobalVars.player_health != 10:
		GlobalVars.player_health += 1
		print("healed")
	timer_started = false
