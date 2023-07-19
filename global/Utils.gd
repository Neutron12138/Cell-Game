extends Node



# 错误数据
var error_data : Dictionary = {}



func load_text(path : String,skip_cr: bool = false) -> Result:
	
	var file = FileAccess.open(path,FileAccess.READ)
	if file == null:
		return Result.error(error_string(FileAccess.get_open_error()))
	
	var result = file.get_as_text(skip_cr)
	file.close()
	
	return Result.result(result)



func load_plugin(path : String,skip_cr : bool = false) -> Result:
	
	var result : Result = null
	
	# 加载数据
	result = load_text(path,skip_cr)
	if not result.ok():
		return result
	var data = JSON.parse_string(result._result)
	
	# 加载插件
	var plugin = Plugin.new()
	plugin._data = data
	result = plugin.initialize()
	if not result.ok():
		return result
	
	# 返回结果
	return Result.result(plugin)



func error(data : Dictionary) -> void:
	error_data = data
	get_tree().change_scene_to_file("res://interfaces/when_error.tscn")
