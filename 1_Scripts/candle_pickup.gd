extends Node2D

var is_player_near: bool = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("interact") and is_player_near:
		GlobalVars.candle_level = 100
		queue_free()

func _on_interaction_area_entered(area: Area2D) -> void:
	is_player_near = true


func _on_interaction_area_exited(area: Area2D) -> void:
	is_player_near = false
