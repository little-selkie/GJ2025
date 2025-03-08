extends Control

@onready var MainScene = $"../../"



func _on_button_pressed() -> void:
	MainScene.pauseMenu()


func _on_button_3_pressed() -> void:
	
	get_tree().quit()
