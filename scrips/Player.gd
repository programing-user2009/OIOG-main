extends CharacterBody2D

var G = Global
@export var PlayerAbilities: Node2D
@export var PlayerMovement: Node2D
@onready var AbiltyAnim = $SoulAnim

func Die():
	print("Game Over!")
	get_tree().quit()

func _ready():
	G.Ycoordinates = 0
	G.Xcoordinates = 0
	G.Coordinates = "0,0"
	$HPFunc.EntityHP = 5

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Down"):
		if PlayerMovement.DirectionOutput == Vector2.ZERO:
			AbiltyAnim.play("down")
		PlayerMovement.Move("down")
	
	elif Input.is_action_just_pressed("Up"):
		if PlayerMovement.DirectionOutput == Vector2.ZERO:
			AbiltyAnim.play("up")
		PlayerMovement.Move("up")
	
	elif Input.is_action_just_pressed("Right"):
		if PlayerMovement.DirectionOutput == Vector2.ZERO:
			AbiltyAnim.play("right")
		PlayerMovement.Move("right")
	
	elif Input.is_action_just_pressed("Left"):
		if PlayerMovement.DirectionOutput == Vector2.ZERO:
			AbiltyAnim.play("left")
		PlayerMovement.Move("left")
	
	elif Input.is_action_just_pressed("UseAbilty"):
		print("using ability: " + str(G.WhatAbilities(G.SoulValue)))
		print("color: " + str(G.SoulValue))
		PlayerAbilities.call(G.WhatAbilities(G.SoulValue))
	
	elif Input.is_action_just_pressed("Interact"):
		if Global.ItemStepedOn == "":
			print("there is nothing!")
		else:
			Global.attempt_collect_item(G.ItemStepedOn, G.TemplateOn)
			print("there is somthing!")
