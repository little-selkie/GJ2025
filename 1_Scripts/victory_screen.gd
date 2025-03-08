extends Control

@onready var transition_main = $TransitionPS




func _on_button_pressed() -> void:
	$VBoxContainer/Button/Click.play()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://0_Scenes/MainScene.tscn")



func _on_exit_pressed() -> void:
	$VBoxContainer/Button2/Click2.play()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://0_Scenes/main_menu.tscn")
	



func _on_button_mouse_entered() -> void:
	$VBoxContainer/Button/Hover.play()


func _on_exit_mouse_entered() -> void:
	$VBoxContainer/Button2/Hover2.play()
