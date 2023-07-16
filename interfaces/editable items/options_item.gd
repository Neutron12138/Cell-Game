extends HBoxContainer

signal item_selected(index : int)

@export
var label : String = ""

@export
var selected : int = -1

@export
var items : Array[String] = []

func _ready() -> void:
	$label.text = label
	for item in items:
		$options.add_item(item)
	$options.selected = selected

func _on_options_item_selected(index : int) -> void:
	emit_signal("item_selected",index)