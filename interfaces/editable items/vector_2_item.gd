extends HBoxContainer

@export
var label : String = ""

@export
var data : Vector2 = Vector2()

func _ready() -> void:
	$label.text = label
	$x.text = str(data.x)
	$y.text = str(data.y)

func get_data() -> Vector2:
	return Vector2(
		float($x.text),
		float($y.text)
	)
