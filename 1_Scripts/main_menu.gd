extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://0_Scenes/MainScene.tscn")
	$VBoxContainer/Button/Click.play()

func _on_exit_pressed() -> void:
	get_tree().quit()
	$VBoxContainer/Button2/Click2.play()


func _on_button_mouse_entered() -> void:
	$VBoxContainer/Button/Hover.play()


func _on_exit_mouse_entered() -> void:
	$VBoxContainer/Button2/Hover2.play()
