extends TextureRect

@export
var viewport_size : Vector2 = Vector2(512.0,512.0)

func _ready() -> void:
	$viewport.size = viewport_size

func get_world_position(screen_pos : Vector2) -> Vector2i:
	return Vector2i.ZERO
