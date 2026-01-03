extends Node2D
#this can also be called item_use tbh
var RotateOrNaw

func Spin():
	$Timer.start(0.5)
	Global.SoulColors = Global.rotate_soul_colors(Global.SoulColors, true) 
	RotateOrNaw = true

func AntiSpin():
	$Timer.start(0.5)
	Global.SoulColors = Global.rotate_soul_colors(Global.SoulColors, false)
	RotateOrNaw = true

func _on_timer_timeout() -> void:
	RotateOrNaw = false

func BombTower():
	pass

func SpawnTower():
	pass

func Reset():
	pass

func DropItem():
	pass

func AbilityBoost():
	pass
