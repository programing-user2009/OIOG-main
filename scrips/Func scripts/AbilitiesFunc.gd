extends Node2D

@export var MovementFunc: Node2D
@export var AttackBody = Area2D
@onready var Enitiy =  $".."

func Dash():
	var DashDir
	match(Global.get_direction_from_color("Blue")):
		"left":
			DashDir = Vector2(-2, 0)
		"right":
			DashDir = Vector2(2, 0)
		"up":
			DashDir = Vector2(0, -2)
		"down":
			DashDir = Vector2(0, 2)
	MovementFunc.DirectionOutput = DashDir
	MovementFunc.Move(Global.get_direction_from_color("Blue"))

func Placement():
	pass

func Heal():
	pass

func Smash():
	AttackBody.monitoring = true
	AttackBody.monitorable = true
	await get_tree().create_timer(0.15).timeout
	AttackBody.monitoring = false
	AttackBody.monitorable = false

func none():
	pass
