extends Node

signal NewAcquiredAbilities(item_name, key)

var Xcoordinates: int = 0
var Ycoordinates: int = 0
var Coordinates: String = ""
var ItemStepedOn: String = ""
var TemplateOn: Node = self
var NotAbility: bool = true
var SoulValue: String = ""
var HPValue: int = 5

var SoulColors = {
	"left": "Blue",
	"right": "Red",
	"down": "Yellow",
	"up": "Green",
}

var Abilities = {
	"Blue": "Dash",
	"Yellow": "Placement",
	"Green": "Heal",
	"Red": "Smash"
}

var AcquiredAbilities = {}
var EquipedAbilities = {}

var MIN_X = 0
var MAX_X = 0
var MIN_Y = 0
var MAX_Y = 0
var blocked_zones = []

func DirectionToSoulConv(direction: String) -> String:
	return SoulColors.get(direction, "none")

func WhatAbilities(color: String) -> String:
	return EquipedAbilities.get(color, "none")

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
		if NotAbility:
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
