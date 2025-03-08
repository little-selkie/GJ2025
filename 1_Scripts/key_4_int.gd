extends CanvasLayer


@onready var key4_img: TextureRect = $VBoxContainer/Key4Img

func update_key4():
	key4_img.visible = GlobalVars.key4 >= 1
