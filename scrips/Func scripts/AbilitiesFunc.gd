extends Node2D

@export var MovementFunc: Node2D
@export var AttackBody: Area2D
@export var Enitiy: CharacterBody2D
@export var HPFunc: Node2D

func Dash():
	MovementFunc.Move(Global.get_direction_from_color("Blue"), 2)

func Placement():
	pass

func Heal():
	HPFunc.heal(1)

func Smash():
	AttackBody.monitoring = true
	await get_tree().create_timer(0.15).timeout
	AttackBody.monitoring = false

func none():
	pass
