extends VBoxContainer

func _ready():
	Events.emit_signal("on_start_menu")

func _on_start_pressed():
	pass

func _on_settings_pressed():
	pass

func _on_exit_pressed():
	Events.emit_signal("on_exit")
	get_tree().quit()

func _on_plugins_pressed():
	pass

func _on_about_pressed():
	pass
