class_name CellManager
extends Node

@export
var world_size : Vector2i = Vector2i()

var _cells : Array[Dictionary] = []

func _ready() -> void:
	_resize(world_size.x * world_size.y)
	print("super")

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

static func is_cell_valid(cell : Dictionary) -> Result:
	return Result.OK()
