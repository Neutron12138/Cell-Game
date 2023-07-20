class_name ConwayCellManager
extends CellManager

const STATE : String = "state"
const DEAD : String = "dead"
const ALIVE : String = "alive"
const STATE_ARRAY : Array[String] = [DEAD,ALIVE]

const STANDARD_CELL : Dictionary = {
	"state" : DEAD
}

func _ready() -> void:
	super._ready()

static func is_cell_valid(cell : Dictionary) -> Result:
	var result = Result.new()
	for key in cell:
		match key:
			STATE:
				if not cell[key] in STATE_ARRAY:
					pass#result._errors.append()
	return result

func update() -> Result:
	return Result.SUCCESSFUL()
