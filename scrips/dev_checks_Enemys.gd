extends Label
@export var HP: Node2D
@export var Main: CharacterBody2D

func _physics_process(delta: float) -> void:
	if Global.DevMode == true:
		self.show()
		$".".text = str("HP: " + str(HP.EntityHP) + "\rAgro: " + str(Main.AgroState) + "\rName: " + str(Main.name) + "\rCords: " + str(Main.EnityX)+", "+str(Main.EnityY))
	else:
		self.hide()
