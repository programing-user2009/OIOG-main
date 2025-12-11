extends Node2D

@onready var Entity = $".."
@export var PlayerMovement: Node2D
@onready var tilemap = get_tree().root.get_node("lv_0/TileMapLayer2")
@export var HPFunc: Node2D
const tile_size = 110
var moving = false
var EnityX = 0
var EnityY = 0
var G = Global
var DirectionOutput = Vector2.ZERO
var player_x = 0
var player_y = 0

func _process(delta: float):
	player_x = G.Xcoordinates
	player_y = G.Ycoordinates
	check_tile()

func _ready() -> void:
	EnityX = Entity.position.x / 110
	EnityY = -Entity.position.y / 110
	print("EnityX: " + str(EnityX), ", EnityY: " + str(EnityY))

func Move(Direction, speed):
	DirectionOutput = Vector2.ZERO
	match Direction:
		"down": DirectionOutput = Vector2(0, speed)
		"up": DirectionOutput = Vector2(0, -speed)
		"right": DirectionOutput = Vector2(speed, 0)
		"left": DirectionOutput = Vector2(-speed, 0)
	if Entity.name == "Player":
		PlayerMovement.try_move(Direction, DirectionOutput)
	else:
		try_move(DirectionOutput)

func try_move(DirectionOutput) -> void:
	if moving:
		return  
	
	var next_x = EnityX + DirectionOutput.x
	var next_y = EnityY - DirectionOutput.y
	
	var blocked = false
	if G.is_out_of_bounds(next_x, next_y):
		blocked = true
		print("blocked! can't move outside")
		return
	
	EnityX = next_x
	EnityY = next_y
	return move()

func move() -> void:
	if not moving and DirectionOutput != Vector2.ZERO:
		if Entity.name == "Player":
			$PlayerMovementFunc.moving = true
		else:
			moving = true
		var tween = create_tween()
		tween.tween_property(Entity, "position", Entity.position + DirectionOutput * tile_size, 0.35)
		tween.tween_callback(move_false)

func move_false() -> void:
	if Entity.name == "Player":
		$PlayerMovementFunc.moving = false
	else:
		moving = false
	DirectionOutput = Vector2(0, 0)

func check_tile():
	var tile_coords = tilemap.local_to_map($"..".global_position)
	var tile_data = tilemap.get_cell_tile_data(tile_coords)
	if tile_data:
		if tile_data.get_custom_data("death point") == true:
			print("HIT!")
			HPFunc.take_damage(1)

func Move_towards_player():
	if player_x > EnityX:
		print("right")
		Move("right", 1)
	elif player_x < EnityX:
		print("left")
		Move("left", 1)
	elif player_y > EnityY:
		print("up")
		Move("up", 1)
	elif player_y < EnityY:
		print("down")
		Move("down", 1)
	elif player_x - EnityX == 0 and player_y - EnityY == 0:
		print("attack")
		Entity.Attack()
