extends Node2D

var EnityX
var EnityY
var SpawnPos: Vector2
var Clone = false
var BlowVar = true

func _process(delta: float) -> void:
	if not Clone:
		self.hide()

func setup(item):
	SpawnPos = item["coords"]
	EnityX = item["coords"].x
	EnityY = item["coords"].y
	self.position = SpawnPos
	self.position.y = -self.position.y
	Clone = true
	$Timer.start(0.5)

func Die():
	queue_free()

func _on_sigma_boom_body_entered(body: Node2D) -> void:
	if Clone and BlowVar:
		var hp = body.get_node_or_null("HPFunc")
		hp.take_damage(3)
		Die()

func _on_timer_timeout() -> void:
	BlowVar = true
