class_name Result
extends RefCounted



var _is_successful : bool = true
var _result = null
var _errors : Array = []
var _warnings : Array = []
var _locations : Array[String] = []



func make_successful() -> void:
	_is_successful = true

func make_failed() -> void:
	_is_successful = false



func add_error(item) -> void:
	_errors.append(item)

func add_errors(array : Array) -> void:
	_errors.append_array(array)

func add_warning(item) -> void:
	_warnings.append(item)

func add_warnings(array : Array) -> void:
	_warnings.append_array(array)

func add_location(location : String) -> void:
	_locations.append(location)



func successful() -> bool:
	return _is_successful

func failed() -> bool:
	return not _is_successful



func _to_string() -> String:
	var result = ""
	
	if _is_successful:
		result = "successful"
	else:
		result = "failed"
	
	if _result != null:
		result += "\nresult:" + str(_result)
	if _errors.size() != 0:
		result += "\nerrors:" + str(_errors) 
	if _warnings.size() != 0:
		result += "\nwarnings:" + str(_warnings)
	if _locations.size() != 0:
		result += "\nlocations:" + str(_locations)
	
	return result



static func result(value,location : String = "") -> Result:
	var result = Result.SUCCESSFUL()
	result._result = value
	if location.length() != 0:
		result.add_location(location)
	return result

static func error(value,location : String = "") -> Result:
	var result = Result.FAILED()
	result._errors.append(value)
	if location.length() != 0:
		result.add_location(location)
	return result

static func warning(value,location : String = "") -> Result:
	var result = Result.FAILED()
	result._warnings.append(value)
	if location.length() != 0:
		result.add_location(location)
	return result

static func forward(previous : Result,location : String = "") -> Result:
	if location.length() != 0:
		previous.add_location(location)
	return previous



static func SUCCESSFUL(location : String = "") -> Result:
	var result = Result.new()
	result.make_successful()
	if location.length() != 0:
		result.add_location(location)
	return result

static func FAILED(location : String = "") -> Result:
	var result = Result.new()
	result.make_failed()
	if location.length() != 0:
		result.add_location(location)
	return result
