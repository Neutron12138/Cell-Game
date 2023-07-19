class_name GameScene2D
extends Node2D

@export
var background_color : Color = Color.DARK_GRAY

@export
var cells_color : Color = Color.LIGHT_GRAY

@export
var cell_shape : ArrayMesh = default_cell_shape(Vector2.ONE)

func _ready() -> void:
	
	# 获取游戏数据
	var game = Global.game
	if game == null:
		Utils.error({"text" : "not good"})
		return
	
	# 设置细胞形状
	$background.multimesh.mesh = cell_shape
	$cells.multimesh.mesh = cell_shape
	
	# 更新
	update()

func update() -> void:
	pass

static func default_cell_shape(half : Vector2) -> ArrayMesh:
	var mesh = ArrayMesh.new()
	
	var vertices = PackedVector2Array()
	vertices.push_back(Vector2(half.x, half.y))
	vertices.push_back(Vector2(-half.x, half.y))
	vertices.push_back(Vector2(half.x, -half.y))
	vertices.push_back(Vector2(-half.x, -half.y))
	
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLE_STRIP, arrays)
	return mesh
