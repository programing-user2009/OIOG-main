extends CharacterBody2D

@export var MovementFunc : Node   # Your movement script
@export var AbilitiesFunc : Node

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
	print(EnityX, EnityY)

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
			MovementFunc.Move(pick_random_direction())
		else:
			print("moving agro")
			MovementFunc.Move_towards_player()

func Attack():
	AbilitiesFunc.Smash()

func Die():
	queue_free()

func _on_agro_checker_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		pass
	AgroState = true
	Player = body


func _on_agro_checker_body_exited(body: Node2D) -> void:
	if body.name != "Player":
		pass
	AgroState = false
	Player = body
