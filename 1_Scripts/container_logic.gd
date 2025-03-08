extends Node2D

var is_player_neraby: bool = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("interact") and is_player_neraby:
		$Interaction.play()
		$AnimationPlayer.play("searching")

func _on_area_interaction_area_entered(area: Area2D) -> void:
	is_player_neraby = true

func _on_area_interaction_area_exited(area: Area2D) -> void:
	is_player_neraby = false
