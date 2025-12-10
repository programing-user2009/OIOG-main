extends Node2D

@onready var Entity = $".."
var EntityHP: int

func take_damage(amount):
	EntityHP -= amount
	print("HP:", EntityHP)
	if EntityHP <= 0:
		Entity.Die()
	if Entity.name == "Player":
		Global.HPValue = EntityHP
