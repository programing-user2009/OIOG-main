extends HBoxContainer

@onready var DiscriptionTitle = $Main/discription
@onready var EquipUnequip = $Checker/Equip_Unequip

var EquipedAbilities = Global.EquipedAbilities.values()
var discription = "N/A"
var LastButtonPressed = ""
var changes = {}
var ItemDiscription = {
	"Dash": "Dash, COST: 2\n\nUse E to dash right after moving a BLUE direction Can't use Red moves for 1 turn/movement CAN NOT BE used to jump over obstacles\n\n She was born to run - Unknown",
	"Placement": "Placement, COST: ?\n\nUse E to Place a item right after moving a Yellow direction Can still move but can't use Yellow moves for 1 turn/movement\n\n an abslute builder - Unknown",
	"Heal": "Heal, COST: ALL\n\nUse E to heal *green movement* HP, can not go above 5 HP can not use any blue abiltys when healing \n\n sHe wanted to help people you know? look what you have done! - ???",
	"Smash": "Smash, COST: 4\n\nUse E to hit everything within a 1 tile radis diagnals count (if i coded this right...)\n\n he's heak of a fighter... - Unknown"
}

func _on_na_pressed() -> void:
	discription = "N/A"

func _on_equip_unequip_pressed() -> void:
	EquipUnequip.text = str(Global.attempt_equip_item(LastButtonPressed))

func _on_ability_button_pressed(item_name):
	print("THIS WORKS!")
	LastButtonPressed = item_name
	discription = ItemDiscription[item_name]

func AbilitiesChanged(item_name, key):
	var new_button = Button.new()
	var reference_button = $Main/ScrollAbilities/AbilitiesStorage/NA
	var abilities_storage = get_node("Main/ScrollAbilities/AbilitiesStorage")
	new_button.name = item_name
	new_button.text = item_name
	new_button.theme = reference_button.theme
	abilities_storage.add_child(new_button)
	new_button.pressed.connect(_on_ability_button_pressed.bind(item_name))

func _ready():
	Global.NewAcquiredAbilities.connect(Callable(self, "AbilitiesChanged"))

func _process(_delta):
	update_text()

func update_text():
	DiscriptionTitle.text = (str(discription))

func _on_blue_pressed() -> void:
	pass

func _on_red_pressed() -> void:
	pass # Replace with function body.

func _on_green_pressed() -> void:
	pass # Replace with function body.

func _on_yellow_pressed() -> void:
	pass # Replace with function body.
