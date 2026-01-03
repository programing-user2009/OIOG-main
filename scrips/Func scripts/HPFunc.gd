extends Node2D

@onready var Entity = $".."
var EntityHP: int
var MaxHP: int
var invincibility = false

func _ready() -> void:
	await get_tree().process_frame
	MaxHP = EntityHP

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

func heal(amount, SomeOrAll):
	if EntityHP < MaxHP:
		if SomeOrAll == "Some":
			EntityHP += amount
		if SomeOrAll == "All":
			EntityHP = MaxHP
	if Entity.name == "Player":
		Global.HPValue = EntityHP
		
