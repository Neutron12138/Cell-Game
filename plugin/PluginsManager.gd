# 插件管理器
class_name PluginsManager
extends Node

const NAME : String = "name"
const ENABLED : String = "enabled"
const OBJECT : String = "object"

# 插件数据
var _plugins : Dictionary = {}

func add_plugin(name : String,plugin : Plugin) -> void:
	_plugins.merge({
		name : {
			ENABLED : false,
			OBJECT : plugin
		}
	})

func remove_plugin(name : String) -> void:
	_plugins.erase(name)
