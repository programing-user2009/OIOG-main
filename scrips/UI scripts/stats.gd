extends HBoxContainer

@onready var Coins_Display = $CoinsDisplay
@onready var HP_Display = $HPDisplay
@onready var Soul_Display = $SoulDisplay
@onready var Coordinates_Display = $CoordinatesDisplay

var coins = 1
var HP = "5/5"
var Soul = "blue"
var XCoordinates = ""
var YCoordinates = ""

func _process(_delta):
	XCoordinates = Global.Xcoordinates
	YCoordinates = Global.Ycoordinates
	Soul = Global.SoulValue
	HP = Global.HPValue
	update_text()

func update_text():
	Coins_Display.text = ("Coins: " + str(coins))
	HP_Display.text = ("HP: " + str(HP) + "/5")
	Soul_Display.text = ("Soul: " + str(Soul))
	Coordinates_Display.text = ("Coordinates: " + str(XCoordinates) + "," + str(YCoordinates))
