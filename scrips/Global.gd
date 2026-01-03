extends Node

signal NewAcquiredAbilities(item_name, key)

var DevMode: bool = true
var Xcoordinates: int = 0
var Ycoordinates: int = 0
var Coordinates: String = ""
var ItemStepedOn: String = ""
var TemplateOn: Node = self
var NotAbility: bool = true
var SoulValue: String = ""
var HPValue: int = 5

var SoulColors = {
	"left":  { "color": "Blue", "count": 0 },
	"up":    { "color": "Green", "count": 0 },
	"right": { "color": "Red", "count": 1000 },
	"down":  { "color": "Yellow", "count": 0 }
}

var Abilities = {
	"Blue": "Dash",
	"Yellow": "Placement",
	"Green": "Heal",
	"Red": "Smash"
}

var AcquiredAbilities = {
	
}

var EquipedAbilities = {
	"Blue": "Dash",
	"Yellow": "Placement",
	"Green": "Heal",
	"Red": "Smash"
}

var MIN_X = 0
var MAX_X = 0
var MIN_Y = 0
var MAX_Y = 0
var blocked_zones = []

func WhatAbilities(color: String) -> String:
	return EquipedAbilities.get(color, "none")

func SoulCounter(drection):
	SoulColors[drection].count += 1
	if drection == "left" and SoulColors["right"].count > 0:
		SoulColors[drection].count -= 1
		SoulColors["right"].count -= 1
	if drection == "right" and SoulColors["left"].count > 0:
		SoulColors[drection].count -= 1
		SoulColors["left"].count -= 1
	if drection == "up" and SoulColors["down"].count > 0:
		SoulColors[drection].count -= 1
		SoulColors["down"].count -= 1
	if drection == "down" and SoulColors["up"].count > 0:
		SoulColors[drection].count -= 1
		SoulColors["up"].count -= 1

func UseSoul(color: String, amount: int, SingleOrAll: String):
	var count = PowerToColor(color, true)
	count -= amount
	if SingleOrAll == "Single":
		var amount2 = amount
		if count < 0:
			print("not enough points!")
			return 0
		else:
			var point = PowerToColor(color, false)
			SoulColors[point].count -= amount2
			return amount
	if SingleOrAll == "All":
		if count < 0:
			print("not enough points!")
			return 0
		else:
			var point = PowerToColor(color, false)
			SoulColors[point].count = 0
			return amount

func PowerToColor(color: String, ReturnCountOrDir): #True = Count, False = Dir
	for dir in SoulColors:
		if SoulColors[dir]["color"] == color:
			if ReturnCountOrDir:
				return SoulColors[dir]["count"]
			else:
				return dir
	return 0 

func is_out_of_bounds(x: float, y: float) -> bool:
	if x <= MIN_X or x >= MAX_X or y <= MIN_Y or y >= MAX_Y:
		return true
	for zone in blocked_zones:
		var pos = zone.pos
		var dir = zone.dir
		match dir:
			"bottom_left":
				if x <= pos.x and y <= pos.y: return true
			"top_right":
				if x >= pos.x and y >= pos.y: return true
			"top_left":
				if x <= pos.x and y >= pos.y: return true
			"bottom_right":
				if x >= pos.x and y <= pos.y: return true
			"tile":
				if x == pos.x and y == pos.y: return true
	return false

func attempt_collect_item(item_name: String, item):
	for key in Abilities:
		if Abilities[key] == item_name:
			AcquiredAbilities[key] = Abilities[key]
			Abilities.erase(key)
			item.hide_item(ItemStepedOn)
			emit_signal("NewAcquiredAbilities", item_name, key)
			return
	if Abilities != null:
		print("uhhhhh oh man...")
		item.hide_item(ItemStepedOn)
	print("Item not found in Abilities:", item_name)

func get_direction_from_color(color: String) -> String:
	for dir in SoulColors:
		if SoulColors[dir] == color:
			return dir
	return ""

func attempt_equip_item(item_name: String) -> String:
	for key in AcquiredAbilities:
		if AcquiredAbilities[key] == item_name:
			EquipedAbilities[key] = AcquiredAbilities[key]
			AcquiredAbilities.erase(key)
			print(key, item_name + " Equipped")
			return "Equipped"

	for key in EquipedAbilities:
		if EquipedAbilities[key] == item_name:
			AcquiredAbilities[key] = EquipedAbilities[key]
			EquipedAbilities.erase(key)
			print(key, item_name + " Unequipped")
			return "Unequipped"

	print("Item not found:", item_name)
	return "N/A"
	
func rotate_soul_colors(SoulColor: Dictionary, clockwise: bool) -> Dictionary:
	var keys = SoulColor.keys()
	var size = keys.size()
	var new_dict := {}
	for i in 4:
		var from_index
		if clockwise:
			from_index = (i - 1) % 4
		else:
			from_index = (i + 1) % 4

		new_dict[keys[i]] = SoulColor[keys[from_index]]
	print(new_dict)
	return new_dict
