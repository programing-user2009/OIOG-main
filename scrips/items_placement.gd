extends Node2D
const tile_size = 110
const start = Vector2( 605, 275)

@onready var ItemScene = preload("res://scenes/template.tscn")
@onready var Enemy_Nitwit = preload("res://scenes/enemy(nitwit).tscn")

func Lv0():
	for item in $"../..".Lv0Items:
		var ItemCopy = ItemScene.instantiate()
		ItemCopy.position = item["coords"]
		ItemCopy.setup(item)
		add_child(ItemCopy)
		await get_tree().process_frame
		
	for item in $"../..".Lv0Enemy:
		var EnemyCopy = load(item["type"]).instantiate()
		EnemyCopy.setup(item)
		add_child(EnemyCopy)
		await get_tree().process_frame
