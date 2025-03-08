extends Node2D

var is_player_near: bool = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("interact") and is_player_near:
		GlobalVars.candle_level = 100
		$CandleSound.play()
		$Timer.start()
		get_node("Interact").visible = false
		self.modulate.a = 0
		$Interaction.monitoring = false
		

func _on_interaction_area_entered(area: Area2D) -> void:
	is_player_near = true
	get_node("Interact").visible = true


func _on_interaction_area_exited(area: Area2D) -> void:
	is_player_near = false
	get_node("Interact").visible = false


func _on_timer_timeout() -> void:
	queue_free()
