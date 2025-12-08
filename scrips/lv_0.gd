extends Node2D

@export var items: Node

var Lv0Items = [
	{
		"coords": Vector2(220, 990), 
		"color": "Blue",
		"action": "Dash"
	},
	{
		"coords": Vector2(660, 330), 
		"color": "Yellow",
		"action": "Placement"
	},
	{
		"coords": Vector2(440, 550), 
		"color": "Red",
		"action": "Smash"
	},
	{
		"coords": Vector2(330, 550), 
		"color": "Green",
		"action": "Heal"
	},
]

var Lv0Enemy = [
	{
		"coords": Vector2(440, -550), 
		"type": "res://scenes/enemy(nitwit).tscn"
	},
]

func _ready() -> void:
	Global.MIN_X = -5
	Global.MAX_X = 12
	Global.MIN_Y = -12
	Global.MAX_Y = 3
	Global.blocked_zones = [
	{"pos": Vector2(-1, -4), "dir": "bottom_left"},
]
	items.call("Lv0")
	
