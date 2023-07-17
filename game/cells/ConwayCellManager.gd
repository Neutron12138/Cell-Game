class_name ConwayCellManager
extends CellManager

func _ready() -> void:
	super._ready()

static func is_cell_valid(cell : Dictionary) -> Result:
	return Result.OK()
