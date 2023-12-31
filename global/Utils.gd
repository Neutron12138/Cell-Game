extends Node



# 错误数据
var error_data : Dictionary = {}



# 从文件加载文本
func load_text(path : String,skip_cr: bool = false) -> Result:
	
	const LOCATION = "Utils.load_text"
	
	var file = FileAccess.open(path,FileAccess.READ)
	if file == null:
		return Result.error(
			error_string(
				FileAccess.get_open_error()
			),LOCATION)
	
	var result = file.get_as_text(skip_cr)
	file.close()
	
	return Result.result(result,LOCATION)



# 从文件加载插件
func load_plugin(path : String,skip_cr : bool = false) -> Result:
	
	const LOCATION = "Utils.load_plugin"
	
	var result = null
	
	# 加载数据
	result = load_text(path,skip_cr)
	if result.failed():
		return result
	var data = JSON.parse_string(result._result)
	
	# 加载插件
	var plugin = Plugin.new()
	plugin._data = data
	result = plugin.initialize()
	if result.failed():
		return Result.forward(result,LOCATION)
	
	# 返回结果
	return Result.result(plugin,LOCATION)



# 跳转到错误界面以汇报错误
func error(data : Dictionary) -> void:
	error_data = data
	get_tree().change_scene_to_file("res://interfaces/when_error.tscn")
