# 全局对象类
extends Node

# 设置数据
var settings : Dictionary = {}

# 游戏对象
var game : Game = null

# 其他数据
var others : Dictionary = {}

# 游戏模式
var game_modes : Array[String] = []

# 插件数据
var plugins : Array[Plugin] = []

func _ready():
	game_modes.append_array(Constants.DEFAULT_GAME_MODES)
	
	var result = Utils.load_plugin("res://tests/script_plugin.json")
	var plugin = result._result
	plugin.name = str(plugins.size())
	plugins.append(plugin)
	add_child(plugin)

# 从文件加载设置
func read_settings():
	pass

# 保存设置到文件
func save_settings():
	pass

# 从文件加载插件
func read_plugins():
	pass

# 保存插件到文件
func save_plugins():
	pass
