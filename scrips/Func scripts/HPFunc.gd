extends Node2D

@onready var Entity = $".."
var EntityHP: int
var invincibility = false

func take_damage(amount):
	if invincibility == false:
		EntityHP -= amount
		print("HP:", EntityHP)
		invincibility = true
		$Timer.start()
		if EntityHP <= 0:
			Entity.Die()
		if Entity.name == "Player":
			Global.HPValue = EntityHP

func _on_timer_timeout() -> void:
	invincibility = false

func heal(amount):
		if EntityHP < 5:
			EntityHP += amount
			$Timer.start()
		if Entity.name == "Player":
			Global.HPValue = EntityHP
