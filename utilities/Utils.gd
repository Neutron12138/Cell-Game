class_name Utils
extends Node

static func load_text(path : String,skip_cr: bool = false) -> Result:
	var file = FileAccess.open(path,FileAccess.READ)
	if file == null:
		return Result.error(error_string(FileAccess.get_open_error()))
	
	var result = file.get_as_text(skip_cr)
	file.close()
	
	return Result.result(result)
