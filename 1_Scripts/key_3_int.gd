extends CanvasLayer


@onready var key3_img: TextureRect = $VBoxContainer/Key3Img

func update_key3():
	key3_img.visible = GlobalVars.key3 >= 1
