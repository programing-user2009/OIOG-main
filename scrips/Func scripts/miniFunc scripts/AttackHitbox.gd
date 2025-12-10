extends Area2D

@onready var Entity = get_parent().get_parent().get_parent()

func _on_body_entered(body: Node2D) -> void:
	print("Hitbox detected: ", body)
	print("DETECTED: ", body, " type=", body.get_class())
	
	var hp = body.get_node_or_null("HPFunc")
	
	if body is CharacterBody2D:
		print("HIT a character:", body.name)
		if not Entity == body:
			hp.take_damage(1)
		else:
			print("ignore hit to self")
			return
		
