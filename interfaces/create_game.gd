extends VBoxContainer

@onready
var game_mode = $settings/container/game_mode

@onready
var world_size = $settings/container/world_size

func _ready() -> void:
	for item in Global.game_modes:
		game_mode.add_item(item)
	
	Events.emit_signal("on_create_game")

func _unhandled_input(event : InputEvent) -> void:
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://interfaces/start_menu.tscn")

func _on_start_pressed() -> void:
	var game = Game.new()
	
	var mode = game_mode.get_data()
	if mode == -1:
		$dialog.dialog_text = "ALERT_GAME_MODE_UNSELECTED"
		$dialog.show()
		return
	game.game_mode = Global.game_modes[mode]
	
	var size = world_size.get_data()
	if size.x <= 0.0 or size.y <= 0.0:
		$dialog.dialog_text = "ALERT_WORLD_SIZE_NOT_POSITIVE"
		$dialog.show()
		return
	game.cells = CellManager.new(size)
	
	Global.game = game
	print(game)
	get_tree().change_scene_to_file("res://game/game_interface.tscn")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://interfaces/start_menu.tscn")
