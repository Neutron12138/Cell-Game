extends TextureRect

@export
var viewport_size : Vector2 = Vector2(512.0,512.0)

func _ready() -> void:
	$viewport.size = viewport_size
