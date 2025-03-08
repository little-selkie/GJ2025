extends CanvasLayer

@onready var health_bar: TextureProgressBar = $HealthBar

func _ready():
	health_bar.value = GlobalVars.player_health
	
func _process(delta):
	health_bar.value = GlobalVars.player_health
