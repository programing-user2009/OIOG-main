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
		"coords": Vector2(770, -990), 
		"type": "res://scenes/enemy(titanium_izi).tscn"
	},
	{
		"coords": Vector2(880, -990), 
		"type": "res://scenes/enemy(Nitwit).tscn"
	},
]

var Lv0InteractiveTiles = [
	{
		"coords": Vector2(440, -660),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(550, -660),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(660, -660),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(770, -660),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(880, -660),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(990, -660),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(1100, -660),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(440, -770),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(550, -770),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(660, -770),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(770, -770),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(880, -770),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(990, -770),
		"type": "res://scenes/spike_trap.tscn"
	},
	{
		"coords": Vector2(1100, -770),
		"type": "res://scenes/landmine.tscn"
	}
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
