extends Node2D

var is_player_near: bool = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("interact") and is_player_near and GlobalVars.ghosts_freed == 10:
		get_tree().change_scene_to_file("res://0_Scenes/victory_screen.tscn")

func _on_interaction_area_entered(area: Area2D) -> void:
	is_player_near = true
	if GlobalVars.ghosts_freed == 10:
			get_node("Interact").visible = true


func _on_interaction_area_exited(area: Area2D) -> void:
	is_player_near = false
	if GlobalVars.ghosts_freed == 10:
		get_node("Interact").visible = false
