extends VBoxContainer

func _ready():
	
	Utils.error_data
	
	Events.emit_signal("on_error")

func _unhandled_input(event : InputEvent) -> void:
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://interfaces/start_menu.tscn")

func _on_ok_pressed():
	get_tree().change_scene_to_file("res://interfaces/start_menu.tscn")
