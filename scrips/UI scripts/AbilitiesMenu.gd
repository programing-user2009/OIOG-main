extends HBoxContainer

@onready var DiscriptionTitle = $Main/discription
@onready var EquipUnequip = $Checker/Equip_Unequip

var EquipedAbilities = Global.EquipedAbilities.values()
var discription = "N/A"
var LastButtonPressed = ""
var changes = {}
var ItemDiscription = {
	"Dash": "Dash\n\nUse E to dash right after moving a BLUE direction\nCan still move but can't use blue moves for 1 turn/movement\nCAN NOT BE used to jump over obstacles\n\n She was born to run - Unknown",
	"Placement": "Placement\n\nUse E to Place a item right after moving a Yellow direction\nCan still move but can't use Yellow moves for 1 turn/movement\n\n an abslute builder - Unknown",
	"Heal": "Heal\n\nPasively heals 1 HP per movement\ncan not use any blue abiltys when healing (canot be disabled)\n\n He wanted to help people you know? look what you have done! - ???",
	"Smash": "Smash\n\nUhhhhhh idk man it's red tho\ntry it out!"
}

func _on_na_pressed() -> void:
	discription = "N/A"

func _on_equip_unequip_pressed() -> void:
	print("this works!")
	EquipUnequip.text = str(Global.attempt_equip_item(LastButtonPressed))

func _on_ability_button_pressed(item_name):
	print("THIS WORKS!")
	LastButtonPressed = item_name
	discription = ItemDiscription[item_name]

func AbilitiesChanged(item_name, key):
	print("ADDING NEW ABILTY")
	var new_button = Button.new()
	
	new_button.text = item_name
	
	var reference_button = $Main/ScrollAbilities/AbilitiesStorage/NA
	new_button.theme = reference_button.theme
	
	var abilities_storage = get_node("Main/ScrollAbilities/AbilitiesStorage")
	abilities_storage.add_child(new_button)
	
	new_button.pressed.connect(_on_ability_button_pressed.bind(item_name))

func _ready():
	Global.NewAcquiredAbilities.connect(Callable(self, "AbilitiesChanged"))

func _process(_delta):
	update_text()

func update_text():
	DiscriptionTitle.text = (str(discription))
