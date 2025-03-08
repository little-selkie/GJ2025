extends Node2D


@onready var Player = get_tree().get_first_node_in_group("player")
@onready var label = $InteractText1

const base_text = "[E] to "

var active_areas = []

var can_interact = true
func register_area(area: InteractionArea):
	active_areas.push_back(area)
	
func unregister_area(area: InteractionArea):
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)
