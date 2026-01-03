extends CharacterBody2D
#low key this is funny as hell lamo

@export var MovementFunc : Node
@export var AbilitiesFunc : Node
@onready var HealStaff = $"Heal Staff"

var EnityX
var EnityY
var move_timer = 0
var move_delay = 0.5
var Player
var directions = ["up", "down", "left", "right"]
var current_direction : String = "idle"
var AgroState = false
var SpawnPos: Vector2
var Clone = false

func setup(item):
	SpawnPos = item["coords"]
	EnityX = item["coords"].x
	EnityY = item["coords"].y
	self.position = SpawnPos
	self.position.y = -self.position.y
	Clone = true
	$HPFunc.EntityHP = 5

func pick_random_direction():
	current_direction = directions.pick_random()
	return current_direction

func _process(delta):
	move_timer += delta
	self.visible = Clone
	if Clone == false:
		return
	if move_timer >= move_delay:
		move_timer = 0
		if not AgroState:
			print("moving normal")
			MovementFunc.Move(pick_random_direction(), 1)
		else:
			MovementFunc.Move(pick_random_direction(), 2)

func Attack():
		HealStaff.monitoring = true
		await get_tree().create_timer(0.15).timeout
		HealStaff.monitoring = false

func Die():
	queue_free()

func _on_heal_check_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		pass
	AgroState = true
	Player = body

func _on_heal_check_body_exited(body: Node2D) -> void:
	if body.name != "Player":
		pass
	AgroState = false
	Player = body

func _on_heal_staff_body_entered(body: Node2D) -> void:
	var hp = body.get_node_or_null("HPFunc")
	if body is CharacterBody2D and not body.name == "Player":
		print("HIT a character:", body.name)
		hp.heal(1 , "Some")
