class_name GameScene2D
extends Node2D

@export
var background_color : Color = Color.DARK_GRAY

@export
var cell_color : Color = Color.LIGHT_GRAY

@export
var cell_size : Vector2 = Vector2.ONE

var _cell_shape : ArrayMesh = default_cell_shape(cell_size / 2.0)



func _ready() -> void:
	
	# 获取游戏数据
	var game = Global.game
	if game == null:
		Utils.error({"text" : "not good"})
		return
	
	# 设置细胞形状
	$background.multimesh.mesh = _cell_shape
	$cells.multimesh.mesh = _cell_shape
	
	# 更新
	update()



# 更新绘制
func update() -> void:
	pass



# 默认的细胞形状
# 矩形
static func default_cell_shape(half : Vector2) -> ArrayMesh:
	var mesh = ArrayMesh.new()
	
	var vertices = PackedVector2Array()
	vertices.push_back(Vector2(half.x, half.y))
	vertices.push_back(Vector2(-half.x, half.y))
	vertices.push_back(Vector2(half.x, -half.y))
	vertices.push_back(Vector2(-half.x, -half.y))
	
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLE_STRIP, arrays)
	return mesh
