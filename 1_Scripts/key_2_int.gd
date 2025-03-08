extends CanvasLayer


@onready var key2_img: TextureRect = $VBoxContainer/Key2Img

func update_key2():
	key2_img.visible = GlobalVars.key2 >= 1
