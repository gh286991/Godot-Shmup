extends Control

signal move_vector(direction: Vector2)
signal fire

var dragging := false
var max_radius := 80.0
var base: TextureRect
var knob: TextureRect

func _ready():
	base = $JoystickBase
	knob = $JoystickBase/JoystickKnob
	_reset_knob()
	knob.mouse_filter = Control.MOUSE_FILTER_PASS
	base.mouse_filter = Control.MOUSE_FILTER_PASS
	knob.connect("gui_input", Callable(self, "_on_knob_gui_input"))
	base.connect("gui_input", Callable(self, "_on_base_gui_input"))
	$FireButton.pressed.connect(_on_fire_button_pressed)

func _on_knob_gui_input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		if event.pressed:
			dragging = true
			_process_drag(base.get_local_mouse_position())
		else:
			dragging = false
			_reset_knob()
			emit_signal("move_vector", Vector2.ZERO)
	elif (event is InputEventScreenDrag or event is InputEventMouseMotion) and dragging:
		_process_drag(base.get_local_mouse_position())

func _on_base_gui_input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		if event.pressed:
			dragging = true
			_process_drag(base.get_local_mouse_position())
		else:
			dragging = false
			_reset_knob()
			emit_signal("move_vector", Vector2.ZERO)
	elif (event is InputEventScreenDrag or event is InputEventMouseMotion) and dragging:
		_process_drag(base.get_local_mouse_position())

func _process_drag(local_pos):
	var center = base.size / 2
	var v = local_pos - center
	if v.length() > max_radius:
		v = v.normalized() * max_radius
	knob.position = center + v - knob.size / 2
	var direction = v / max_radius
	emit_signal("move_vector", direction)

func _reset_knob():
	var center = $JoystickBase.size / 2
	$JoystickBase/JoystickKnob.position = center - $JoystickBase/JoystickKnob.size / 2

func _on_fire_button_pressed():
	emit_signal("fire") 
