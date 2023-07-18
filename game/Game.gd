# 游戏对象
class_name Game
extends Node

var game_mode : String = Constants.GAME_MODE_NONE
var cells : CellManager = null

func _to_string() -> String:
	return str({
		"game mode" : game_mode,
		"cells" : str(cells)
	})
