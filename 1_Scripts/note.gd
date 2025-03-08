extends StaticBody2D

var is_player_near: bool = false
var is_note_readed: bool = false


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and is_note_readed:
		get_node("OnScreenNote").visible = false
	if Input.is_action_pressed("interact"):
		if is_player_near:
			open_door()
	if Input.is_key_pressed(KEY_R) and is_note_readed:
		get_node("OnScreenNote").visible = true


func _on_area_of_interaction_area_entered(area: Area2D) -> void:
	print("you can pick up")
	is_player_near = true
	get_node("Interact").visible = true


func _on_area_of_interaction_area_exited(area: Area2D) -> void:
	print("you can't pick up")
	is_player_near = false
	get_node("Interact").visible = false
	
func open_door() -> void:
	get_node("AreaOfInteraction").monitoring = false
	get_node("Note").visible = true
	get_node("OnScreenNote").visible = true
	is_note_readed = true
	if GlobalVars.note != 1 and GlobalVars.amulet == 3: 
		GlobalVars.is_exorcism_available = true
		GlobalVars.note += 1
		print(GlobalVars.note)
		if GlobalVars.note == 1:
			print("u full")
		else: 
			print("u full")
	self.modulate.a = 0
