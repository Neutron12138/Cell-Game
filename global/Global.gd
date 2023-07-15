# 全局对象类
extends Node

# 设置数据
var settings : Dictionary = {}

# 插件数据
var plugins : PluginsManager = PluginsManager.new()

# 其他数据
var others : Dictionary = {}

func _ready():
	var file = FileAccess.open("res://tests/script_plugin.json",FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	file.close()
	
	var plugin = Plugin.new()
	plugin._data = data
	print(str(plugin.initialize()))
	print(plugin.to_string())
	
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
