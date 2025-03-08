extends StaticBody2D

var is_player_near: bool = false


func _process(delta: float) -> void:
	if Input.is_action_pressed("interact"):
		if is_player_near:
			open_door()

		$Key.update_key2()


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
	if GlobalVars.key2 != 1: 
		GlobalVars.key2 += 1
		print(GlobalVars.key2)
		if GlobalVars.key2 == 1:
			print("u full")
		else: 
			print("u full")
			
	$AnimationPlayer.play("door_open")
