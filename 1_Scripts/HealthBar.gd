extends CanvasLayer

@onready var health_bar: TextureProgressBar = $HealthBar
@onready var candle_level: TextureProgressBar = $CandleBar

func _ready():
	health_bar.value = GlobalVars.player_health
	candle_level.value = GlobalVars.candle_level
	
func _process(delta):
	health_bar.value = GlobalVars.player_health
	candle_level.value = GlobalVars.candle_level
