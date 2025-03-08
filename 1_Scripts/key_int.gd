extends CanvasLayer


@onready var key_number: Label = $VBoxContainer/Label

func update_key():
	key_number.text = str(GlobalVars.key)
