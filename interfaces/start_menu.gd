extends VBoxContainer

func _ready():
	Events.emit_signal("on_start_menu")

func _unhandled_input(event):
	if event.is_action_pressed("escape"):
		Events.emit_signal("on_exit")
		get_tree().quit()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://interfaces/start_game.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://interfaces/game_settings.tscn")

func _on_exit_pressed():
	Events.emit_signal("on_exit")
	get_tree().quit()

func _on_plugins_pressed():
	pass

func _on_about_pressed():
	pass

func _on_guide_pressed():
	pass

func _on_load_pressed():
	pass

func _on_more_pressed():
	pass
