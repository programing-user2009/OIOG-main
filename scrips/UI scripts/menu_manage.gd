extends MarginContainer

@export var menu_screen: VBoxContainer
@export var menu_screen_showing: VBoxContainer

@export var settings_menu_screen: MarginContainer
@export var abilities_menu_screen: MarginContainer
@export var inventory_menu_screen: MarginContainer

@export var open_menu_screen: Button
@export var closed_menu_screen: Button
@export var play_menu_screen: Button
@export var inventory_menu_open: Button
@export var powers_menu_screen: Button
@export var setting_menu_screen: Button
@export var quit_settings_screen: Button
@export var save_settings_screen: Button
@export var back_settings_screen: Button

var in_menu_buttons: Array
var toggle_popupmenu_buttons: Array


func _ready():
	in_menu_buttons = [back_settings_screen, save_settings_screen, quit_settings_screen, play_menu_screen, inventory_menu_open, powers_menu_screen, setting_menu_screen]
	toggle_popupmenu_buttons = [open_menu_screen, closed_menu_screen]

func _process(delta):
	update_butten_scale()

func update_butten_scale():
	for button in in_menu_buttons:
		button_hov(button, 1.1, 0.2)
	for button in toggle_popupmenu_buttons:
		button_hov(button, 1.3, 0.2)

func button_hov(button: Button, tween_amt, duration):
	button.pivot_offset = button.size / 2
	if button.is_hovered():
		tween(button, "scale", Vector2.ONE * tween_amt, duration)
	else:
		tween(button, "scale", Vector2.ONE, duration)

func tween(button, property, amount, duration):
	var tween = create_tween()
	tween.tween_property(button, property, amount, duration)

func toggle_visibility(object):
	var anim = $AnimationPlayer
	var anim_type: String
	if object.visible:
		anim_type = "close_"
	else:
		anim_type = "open_"
	anim.play(anim_type + str(object.name))

func _on_open_or_close_pressed() -> void:
	toggle_visibility(menu_screen)

func _on_settings_pressed() -> void:
	toggle_visibility(settings_menu_screen)

func _on_abilities_pressed() -> void:
	toggle_visibility(abilities_menu_screen)

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_inventory_pressed() -> void:
	toggle_visibility(inventory_menu_screen)
