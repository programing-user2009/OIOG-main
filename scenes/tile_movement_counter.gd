extends MarginContainer
@onready var BluePanel = $VBoxContainer/BlueMain/Control/Panel
@onready var GreenPanel = $VBoxContainer/GreenMain/Control/Panel
@onready var YellowPanel = $VBoxContainer/YellowMain/Control/Panel
@onready var RedPanel = $VBoxContainer/RedMain/Control/Panel
@onready var BlueLabel = $VBoxContainer/BlueMain/Label
@onready var GreenLabel = $VBoxContainer/GreenMain/Label3
@onready var YellowLabel = $VBoxContainer/YellowMain/Label2
@onready var RedLabel = $VBoxContainer/RedMain/Label4
var RotateOrNaw = false

func _process(delta: float) -> void:
	update_text()

func Rotate(Rotate):
	if RotateOrNaw == true:
		print("still spining hold on!")
		return
	if Rotate == "Spin":
		Spin()
	if Rotate == "Antispin":
		AntiSpin()
	return

func Spin():
	$Timer.start(0.5)
	Global.SoulColors = Global.rotate_soul_colors(Global.SoulColors, true) 
	RotateOrNaw = true
	var tween = create_tween().set_parallel(true)
	tween.tween_property(BluePanel, "rotation_degrees", BluePanel.rotation_degrees + 90, 0.5)
	tween.tween_property(GreenPanel, "rotation_degrees", GreenPanel.rotation_degrees + 90, 0.5)
	tween.tween_property(YellowPanel, "rotation_degrees", YellowPanel.rotation_degrees + 90, 0.5)
	tween.tween_property(RedPanel, "rotation_degrees", RedPanel.rotation_degrees + 90, 0.5)

func AntiSpin():
	$Timer.start(0.5)
	Global.SoulColors = Global.rotate_soul_colors(Global.SoulColors, false)
	RotateOrNaw = true
	var tween = create_tween().set_parallel(true)
	tween.tween_property(BluePanel, "rotation_degrees", BluePanel.rotation_degrees - 90, 0.5)
	tween.tween_property(GreenPanel, "rotation_degrees", GreenPanel.rotation_degrees - 90, 0.5)
	tween.tween_property(YellowPanel, "rotation_degrees", YellowPanel.rotation_degrees - 90, 0.5)
	tween.tween_property(RedPanel, "rotation_degrees", RedPanel.rotation_degrees - 90, 0.5)

func _on_timer_timeout() -> void:
	RotateOrNaw = false

func update_text():
	BlueLabel.text = "Blue: " + str(Global.PowerToColor("Blue", true))
	GreenLabel.text =  "Green: " + str(Global.PowerToColor("Green", true))
	YellowLabel.text = "Yellow: " + str(Global.PowerToColor("Yellow", true))
	RedLabel.text = "Red: " + str(Global.PowerToColor("Red", true))
