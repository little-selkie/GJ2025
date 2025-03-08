extends CanvasLayer

@onready var texture_box1: TextureRect = $Amulets_box/Amulet1
@onready var texture_box2: TextureRect = $Amulets_box/Amulet2
@onready var texture_box3: TextureRect = $Amulets_box/Amulet3

func update_amulets():
   texture_box1.visible = GlobalVars.amulet >= 1
   texture_box2.visible = GlobalVars.amulet >= 2
   texture_box3.visible = GlobalVars.amulet >= 3
