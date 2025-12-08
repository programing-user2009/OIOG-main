extends Node2D

@onready var Entity = $".."
var EntityHP = 1

func take_damage(amount):
	EntityHP -= amount
	print("HP:", EntityHP)
	if EntityHP <= 0:
		Entity.Die()
