extends Control

func _ready() -> void:
	var locale = TranslationServer.get_locale()
	if locale in Constants.DEFAULT_LANGUAGES:
		$scroll/game/language.selected = Constants.DEFAULT_LANGUAGES.find(locale)
	Events.emit_signal("on_game_settings")

func _process(delta : float) -> void:
	pass

func _unhandled_input(event : InputEvent) -> void:
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://interfaces/start_menu.tscn")

func _on_language_item_selected(index) -> void:
	print(Constants.DEFAULT_LANGUAGES[index])
