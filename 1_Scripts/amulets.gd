extends StaticBody2D

var is_player_near: bool = false


func _process(delta: float) -> void:
	if Input.is_action_pressed("interact"):
		if is_player_near:
			open_door()

		$Amulets.update_amulets()


func _on_area_of_interaction_area_entered(area: Area2D) -> void:
	print("you can pick up")
	is_player_near = true
	get_node("Interact").visible = true


func _on_area_of_interaction_area_exited(area: Area2D) -> void:
	print("you can't pick up")
	is_player_near = false
	get_node("Interact").visible = false
	
func open_door() -> void:
	get_node("CollisionShape2D").disabled = true
	get_node("AreaOfInteraction").monitoring = false
	get_node("LightOccluder2D").visible = false
	if GlobalVars.amulet != 3: 
		GlobalVars.amulet += 1
		print(GlobalVars.amulet)
		if GlobalVars.amulet == 3 and GlobalVars.note >= 1:
			GlobalVars.is_exorcism_available = true
		else: 
			print("u full")
			
	$AnimationPlayer.play("door_open")
