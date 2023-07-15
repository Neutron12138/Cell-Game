class_name Result
extends RefCounted

var _ok : bool = true
var _results = null
var _errors : Array = []
var _warnings : Array = []

func _to_string() -> String:
	var result = ""
	
	if _ok:
		result = "OK"
	else:
		result = "Error"
	
	if _results != null:
		result += "\nresult:" + str(_results)
	if _errors.size() != 0:
		result += "\nerrors:" + str(_errors) 
	if _warnings.size() != 0:
		result += "\nwarnings:" + str(_warnings)
	
	return result

static func result(value) -> Result:
	var result = Result.new()
	result._ok = false
	result._result = value
	return result

static func error(value) -> Result:
	var result = Result.new()
	result._ok = false
	result._errors.append(value)
	return result

static func warning(value) -> Result:
	var result = Result.new()
	result._ok = false
	result._warnings.append(value)
	return result

static func OK() -> Result:
	return Result.new()
