extends Control

@onready var transition = $Transition


func _ready() -> void:
	transition.play("fade_in")


func _on_button_pressed() -> void:
	$VBoxContainer/Button/Click.play()
	transition.play("fade_out")

func _on_transition_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://0_Scenes/MainScene.tscn")

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://0_Scenes/main_menu.tscn")
	$VBoxContainer/Button2/Click2.play()


func _on_button_mouse_entered() -> void:
	$VBoxContainer/Button/Hover.play()


func _on_exit_mouse_entered() -> void:
	$VBoxContainer/Button2/Hover2.play()
