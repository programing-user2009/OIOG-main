extends Node2D

@export var MovementFunc: Node2D
@export var AttackBody: Area2D
@export var Enitiy: CharacterBody2D
@export var HPFunc: Node2D

func Dash():
	var count = Global.UseSoul("Blue", 2)
	if not count == 0:
		MovementFunc.Move(Global.PowerToColor("Blue", false), 2)

func Placement():
	pass

func Heal():
	var count = Global.UseSoul("Green", 1)
	if not count == 0:
		HPFunc.heal(1)

func Smash():
	var count = Global.UseSoul("Red", 4)
	if not count == 0:
		AttackBody.monitoring = true
		await get_tree().create_timer(0.15).timeout
		AttackBody.monitoring = false

func none():
	pass
