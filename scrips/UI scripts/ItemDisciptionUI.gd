extends HBoxContainer

@export var DiscriptionImage: TextureRect
@export var DiscriptionLable: Label
@export var AmountLable: Label
@onready var MovementChange = $"../../../../TileMovementCounter"
@onready var Spin = $"../../../Menu/main menu/controls/NinePatchRect/menu items/VBoxContainer/ItemsQuickUse/HBoxContainer/Spin"
@onready var Antispin = $"../../../Menu/main menu/controls/NinePatchRect/menu items/VBoxContainer/ItemsQuickUse/HBoxContainer/AntiSpin"
@onready var BombTower = $"../../../Menu/main menu/controls/NinePatchRect/menu items/VBoxContainer/ItemsQuickUse/HBoxContainer/BombTower"
@onready var SpawnTower = $"../../../Menu/main menu/controls/NinePatchRect/menu items/VBoxContainer/ItemsQuickUse/HBoxContainer/SpawnTower"
@onready var Reset = $"../../../Menu/main menu/controls/NinePatchRect/menu items/VBoxContainer/ItemsQuickUse/HBoxContainer/Reset"
@onready var AbilityBoost = $"../../../Menu/main menu/controls/NinePatchRect/menu items/VBoxContainer/ItemsQuickUse/HBoxContainer/AbilityBoost"
var SpinAmount = 0
var AntispinAmount = 0
var BombTowerAmount = 0
var SpawnTowerAmount = 0
var ResetAmount = 0
var AbilityBoostAmount = 0
var ItemOn = "Spin"

var ItemAmount = {
	"Spin": SpinAmount,
	"Antispin": AntispinAmount,
	"BombTower": BombTowerAmount,
	"SpawnTower": SpawnTowerAmount,
	"Reset": ResetAmount,
	"AbilityBoost": AbilityBoostAmount,
}

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

func _process(delta):
	Spin.text = str(SpinAmount)
	Antispin.text = str(AntispinAmount)
	BombTower.text = str(BombTowerAmount)
	SpawnTower.text = str(SpawnTowerAmount)
	Reset.text = str(ResetAmount)
	AbilityBoost.text = str(AbilityBoostAmount)

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
	AmountLable.text = "Amount:\n" + str(ItemAmount[ChangeTo])
	ItemOn = ChangeTo

func _on_use_button_pressed() -> void:
	MovementChange.Rotate(ItemOn)
