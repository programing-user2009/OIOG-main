extends Control

var normal_scale := Vector2(1, 1)
var hover_scale := Vector2(1.1, 1.1)

func _ready():
	var buttons = find_children("", "Button", true, false)

	for button in buttons:
		button.pivot_offset = button.size / 2
		button.connect("mouse_entered", Callable(self, "_on_button_hovered").bind(button))
		button.connect("mouse_exited", Callable(self, "_on_button_unhovered").bind(button))

		match button.name.to_lower():
			"play":
				button.connect("pressed", Callable(self, "_on_play_pressed"))
			"options":
				button.connect("pressed", Callable(self, "_on_options_pressed"))
			"quit":
				button.connect("pressed", Callable(self, "_on_quit_pressed"))

func _on_button_hovered(button: Button):
	var tween = create_tween()
	tween.tween_property(button, "scale", hover_scale, 0.2)

func _on_button_unhovered(button: Button):
	var tween = create_tween()
	tween.tween_property(button, "scale", normal_scale, 0.2)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/lv_0.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
