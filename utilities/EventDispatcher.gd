class_name EventDispatcher
extends Node


signal on_mouse_rolled(is_down : bool,delta : float)
signal on_mouse_double_clicked(button_index : MouseButton)
signal on_mouse_pressed(button_index : MouseButton)
signal on_mouse_released(button_index : MouseButton)
signal on_mouse_moved(relative : Vector2)


@export
var not_emit_when_double_clicked : bool = true


func _unhandled_input(event : InputEvent) -> void:
	if event is InputEventMouseButton:
		_on_mouse_button(event)
	elif event is InputEventMouseMotion:
		_on_mouse_motion(event)


func _on_mouse_button(event : InputEventMouseButton) -> void:
	var button_index = event.button_index
	
	if event.double_click:
		emit_signal("on_mouse_double_clicked",button_index)
		if not not_emit_when_double_clicked:
			if event.pressed:
				emit_signal("on_mouse_pressed",button_index)
			else:
				emit_signal("on_mouse_released",button_index)
	else:
		if event.pressed:
			emit_signal("on_mouse_pressed",button_index)
		else:
			emit_signal("on_mouse_released",button_index)
	
	if button_index == MouseButton.MOUSE_BUTTON_WHEEL_UP:
		emit_signal("on_mouse_rolled",false,event.factor)
	elif button_index == MouseButton.MOUSE_BUTTON_WHEEL_DOWN:
		emit_signal("on_mouse_rolled",true,event.factor)


func _on_mouse_motion(event : InputEventMouseMotion) -> void:
	emit_signal("on_mouse_moved",event.relative)
