extends Node2D

@export var MovementFunc: Node2D
@export var AttackBody: Area2D
@export var Enitiy: CharacterBody2D
@export var HPFunc: Node2D

func Dash():
	var check = Global.UseSoul("Blue", 2, "Single")
	if not check == 0 or not Enitiy.name == "Player":
		MovementFunc.Move(Global.PowerToColor("Blue", false), 2)

func Placement():
	pass

func Heal():
	var count = Global.PowerToColor("Green", true)
	var check = Global.UseSoul("Green", 1, "All")
	if not check == 0:
		print(count, HPFunc.MaxHP)
		if count < HPFunc.MaxHP:
			HPFunc.heal(check, "Some")
		if count >= HPFunc.MaxHP:
			HPFunc.heal(check, "All")
	if not Enitiy.name == "Player":
		HPFunc.heal(3, "Some")

func Smash():
	var check = Global.UseSoul("Red", 4, "Single")
	if not check == 0 or not Enitiy.name == "Player":
		AttackBody.monitoring = true
		await get_tree().create_timer(0.15).timeout
		AttackBody.monitoring = false

func none():
	pass
