extends HBoxContainer

@export var DiscriptionImage: TextureRect
@export var DiscriptionLable: Label

var ItemDiscription = {
	"Spin": "will",
	"Antispin": "this",
	"BombTower": "work",
	"SpawnTower": "bruh",
	"Reset": "like",
	"AbilityBoost": "yk?",
	}

var ImageDiscription = {
	"Spin": "res://assets/photos/items/pixil-frame-0 (37).png",
	"Antispin": "res://assets/photos/items/pixil-frame-0 (38).png",
	"BombTower": "res://assets/photos/items/pixil-frame-0 (39).png",
	"SpawnTower": "res://assets/photos/items/pixil-frame-0 (40).png",
	"Reset": "res://assets/photos/items/pixil-frame-0 (41).png",
	"AbilityBoost": "res://assets/photos/items/pixil-frame-0 (42).png",
}

func _on_spin_pressed() -> void:
	ChangeUI("Spin")

func _on_anti_spin_pressed() -> void:
	ChangeUI("Antispin")

func _on_bomb_tower_pressed() -> void:
	ChangeUI("BombTower")

func _on_spawn_tower_pressed() -> void:
	ChangeUI("SpawnTower")

func _on_reset_pressed() -> void:
	ChangeUI("Reset")

func _on_ability_boost_pressed() -> void:
	ChangeUI("AbilityBoost")

func ChangeUI(ChangeTo):
	DiscriptionLable.text = ItemDiscription[ChangeTo]
	DiscriptionImage.texture = load(ImageDiscription[ChangeTo])
