# 插件对象
class_name Plugin
extends Node

const LATEST_VERSION : int = 1
const MIN_VERSION : int = 1
const TYPE : String = "type"
const TYPE_UNKNOWN : String = "unknown"
const TYPE_SCRIPT : String = "script"
const TYPE_DATA : String = "data"
const VERSION : String = "version"
const SCRIPTS : String = "scripts"

var _data : Dictionary = {
	TYPE : TYPE_UNKNOWN,
	VERSION : 1
}

func _ready() -> void:
	pass

# 初始化插件
# 如果返回"OK"，则初始化成功
# 否则会返回错误信息
func initialize() -> Result:
	
	const LOCATION = "Plugin.initialize"
	
	# 检查"type"是否存在
	if _data.get(TYPE) == null:
		return Result.error("The 'type' cannot be null or does not exist",LOCATION)
	
	# 检查"version"是否存在
	if _data.get(VERSION) == null:
		return Result.error("The 'version' cannot be null or does not exist",LOCATION)
	
	# 检查版本
	if _data.version < MIN_VERSION or _data.version > LATEST_VERSION:
		return Result.error("Wrong plugin version",LOCATION)
	elif _data.version < LATEST_VERSION:
		return Result.warning("The plugin version is outdated",LOCATION)
	
	# 解析
	match _data.type:
		TYPE_UNKNOWN:
			return _init_unknown()
		TYPE_SCRIPT:
			return _init_script()
		TYPE_DATA:
			return _init_data()
		_:
			return Result.error("Unknown plugin type: " + _data.type,LOCATION)

# 初始化unknown类型的插件
# 什么都不做且始终返回"OK"
func _init_unknown() -> Result:
	const LOCATION = "Plugin._init_unknown"
	return Result.SUCCESSFUL(LOCATION)

# 初始化script类型的插件
func _init_script() -> Result:
	
	const LOCATION = "Plugin._init_script"
	
	# 检查"scripts"是否存在
	var scripts = _data.get(SCRIPTS)
	if scripts == null:
		return Result.error("The 'scripts' of a 'Script' plugin cannot be null or does not exist",LOCATION)
	
	if not scripts is Array:
		return Result.error("The 'scripts' of a 'Script' plugin must be 'Array' type",LOCATION)
	
	for i in range(scripts.size()):
		var path = scripts[i]
		var result = load_node_script(path)
		
		if result.failed():
			return Result.forward(result,LOCATION)
		
		var object = result._result
		object.name = str(i)
		add_child(object)
	
	return Result.SUCCESSFUL(LOCATION)

# 初始化data类型的插件
# 什么都不做且始终返回"OK"
func _init_data() -> Result:
	const LOCATION = "Plugin._init_data"
	return Result.SUCCESSFUL(LOCATION)

# 重载to_string()
# 返回_data中的内容
func _to_string() -> String:
	return str(_data)

static func load_node_script(path : String,skip_cr : bool = false) -> Result:
	
	const LOCATION = "Plugin.load_node_script"
	
	# 加载脚本
	var result = Utils.load_text(path,skip_cr)
	if result.failed():
		return Result.forward(result,LOCATION)
	var source_code = result._result
	
	# 创建脚本
	var script = GDScript.new()
	script.source_code = source_code
	script.reload()
	
	# 检查是否能实例化
	if not script.can_instantiate():
		return Result.error("Invalid 'Script' plugin because it cannot be instantiated",LOCATION)
	
	# 实例化
	var object = script.new()
	
	# 检查类型
	if not object is Node:
		return Result.error("The 'Script' plugin must extend from 'Node'",LOCATION)
	
	# 返回结果
	return Result.result(object,LOCATION)
