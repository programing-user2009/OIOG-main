extends Node2D

enum State { IDLE, MOVING_UP, ATTACK, WALL }
var state: State = State.IDLE
var SpawnPos: Vector2
var Clone = false
var EnityX
var EnityY
var dir = "up"

@export var tile_size = 110
@onready var timer: Timer = $Timer

func _ready():
	timer.timeout.connect(_on_timer_timeout)
	_enter_state(State.IDLE)
	if Clone == false:
		self.hide()
		return

func setup(item):
	SpawnPos = item["coords"]
	EnityX = item["coords"].x
	EnityY = item["coords"].y
	self.position = SpawnPos
	self.position.y = -self.position.y
	Clone = true
	connect("spike_wall", Callable(self, "_on_spike_wall"))

func _enter_state(new_state: State):
	state = new_state
	if Clone == false:
		self.hide()
		return
	
	match state:
		State.IDLE:
			# Spike down, no damage
			set_damage_enabled(false)
			$AnimatedSprite2D.play("idle")
			timer.wait_time = 3.0

		State.MOVING_UP:
			# rising animation
			set_damage_enabled(false)
			$AnimatedSprite2D.play("rise")
			timer.wait_time = 1.0

		State.ATTACK:
			# spike fully out, deals damage
			set_damage_enabled(true)
			$AnimatedSprite2D.play("attack")
			timer.wait_time = 1.0

		State.WALL:
			# blocking wall, deals damage
			set_damage_enabled(true)
			$AnimatedSprite2D.play("wall")
			timer.wait_time = 3.0
			spike_wall(self.position.x, self.position.y)

	timer.start()


func _on_timer_timeout():
	match state:
		State.IDLE:
			_enter_state(State.MOVING_UP)
			dir = "up"

		State.MOVING_UP:
				if dir == "up":
					_enter_state(State.ATTACK)
				elif dir == "down":
					_enter_state(State.IDLE)

		State.ATTACK:
				if dir == "up":
					_enter_state(State.WALL)
				elif dir == "down":
					_enter_state(State.MOVING_UP)

		State.WALL:
			_enter_state(State.ATTACK)
			dir = "down"

var damage_active = false

func set_damage_enabled(active: bool):
	damage_active = active

func _on_entity_detector_body_entered(body: Node2D) -> void:
	if not damage_active:
		return
	if Clone == false:
		self.hide()
		return
	
	var hp = body.get_node_or_null("HPFunc")
	
	if body is CharacterBody2D:
		hp.take_damage(1)

func spike_wall(x, y):
	var block = {"pos": Vector2(x / 110, y / -110), "dir": "tile"}
	Global.blocked_zones.append(block)
	await get_tree().create_timer(3.0).timeout
	Global.blocked_zones.erase(block)
