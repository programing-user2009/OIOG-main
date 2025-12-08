extends Node2D

const tile_size = 110
var moving = false
var G = Global
var DirectionOutput = Vector2.ZERO

func try_move(Direction, DirectionOutput) -> void:
	if moving:
		return  
	var next_x = G.Xcoordinates + DirectionOutput.x
	var next_y = G.Ycoordinates - DirectionOutput.y
	
	var blocked = false
	if G.is_out_of_bounds(next_x, next_y):
		blocked = true
		print("blocked! can't move outside, player")
		return
	
	G.Xcoordinates = next_x
	G.Ycoordinates = next_y
	G.SoulValue = G.DirectionToSoulConv(Direction)
	return $"..".move()
