extends Node2D

@export var label: Control

var ItemIs = ""
var TempOn = self
var NotAblility = Global.NotAbility

func hide_item(item_name):
	if item_name == ItemIs:
		print("Hiding item:", ItemIs)
		visible = false


func setup(data):
	var animation = data["color"]
	var SpawnPos = data["coords"]
	ItemIs = data["action"]
	if not ItemIs in Global.Abilities:
		NotAblility = false
	$ItemsIcon.play(animation)
	$label/Color.play(animation)
	self.position = SpawnPos

func _on_hit_box_body_entered(body: Node2D) -> void:
	toggle_visibility(label)
	Global.ItemStepedOn = ItemIs
	Global.TemplateOn = TempOn

func _on_hit_box_body_exited(body: Node2D) -> void:
	toggle_visibility(label)
	Global.ItemStepedOn = ""
	Global.TemplateOn = null

func toggle_visibility(object):
	var anim = $AnimationPlayer
	var anim_type: String
	if object.visible:
		anim_type = "close"
	else:
		anim_type = "open"
	anim.play(anim_type)
