extends Area2D

@export var AbilitiesFunc: Node

func _on_area_entered(area: Area2D):
	print("Hitbox detected: ", area)

	var parent = area.get_parent()
	var hp = parent.get_node_or_null("HPFunc")

	if parent == AbilitiesFunc.Entity:
		print("same active user!")
		return

	if hp:
		hp.take_damage(1)
		print("hit ", parent)
