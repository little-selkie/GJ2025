extends CanvasLayer


@onready var key_img: TextureRect = $VBoxContainer/KeyImg

func update_key():
	key_img.visible = GlobalVars.key >= 1
