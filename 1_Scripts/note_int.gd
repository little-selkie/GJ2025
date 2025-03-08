extends CanvasLayer

@onready var note_box: TextureRect = $Note


func update_note():
   note_box.visible = GlobalVars.note >= 1
