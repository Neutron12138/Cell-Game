extends VBoxContainer

func _ready() -> void:
	Events.emit_signal("on_create_game")

func _unhandled_input(event : InputEvent) -> void:
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://interfaces/start_menu.tscn")

func _on_game_mode_item_selected(index : int) -> void:
	print(Constants.DEFAULT_GAME_MODES[index])

func _on_start_pressed():
	get_tree().change_scene_to_file("res://game/game_interface.tscn")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://interfaces/start_menu.tscn")
