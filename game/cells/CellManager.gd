class_name CellManager
extends Node

var _world_size : Vector2i = Vector2i()
var _cells : Array[Dictionary] = []

func _init(size : Vector2i,cells : Array[Dictionary] = []) -> void:
	_world_size = size
	_resize(_world_size.x * _world_size.y)
	_cells = cells

func _resize(size : int) -> void:
	_cells.resize(size)

func set_cell(index : int,cell : Dictionary) -> Result:
	if index >= 0 and index < _cells.size():
		_cells[index] = cell
		return Result.OK()
	else:
		return Result.error("Invalid index: " + str(index))

func get_cell(index : int) -> Result:
	if index >= 0 and index < _cells.size():
		return Result.result(_cells[index])
	else:
		return Result.error("Invalid index: " + str(index))

func set_cells(cells : Array[Dictionary]) -> void:
	_cells = cells

func get_cells() -> Array[Dictionary]:
	return _cells

func update() -> Result:
	return Result.OK()

func _to_string() -> String:
	return str({
		"world_size" : str(_world_size),
		"cells" : str(_cells)
	})

static func is_cell_valid(cell : Dictionary) -> Result:
	return Result.OK()
