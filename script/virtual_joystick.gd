extends Control

signal move_left
signal move_right
signal move_up
signal move_down
signal fire
signal stop_left
signal stop_right
signal stop_up
signal stop_down

func _ready():
	$LeftButton.button_down.connect(_on_left_button_pressed)
	$LeftButton.button_up.connect(_on_left_button_released)
	$RightButton.button_down.connect(_on_right_button_pressed)
	$RightButton.button_up.connect(_on_right_button_released)
	$UpButton.button_down.connect(_on_up_button_pressed)
	$UpButton.button_up.connect(_on_up_button_released)
	$DownButton.button_down.connect(_on_down_button_pressed)
	$DownButton.button_up.connect(_on_down_button_released)
	$FireButton.pressed.connect(_on_fire_button_pressed)

func _on_left_button_pressed():
	emit_signal("move_left")

func _on_left_button_released():
	emit_signal("stop_left")

func _on_right_button_pressed():
	emit_signal("move_right")

func _on_right_button_released():
	emit_signal("stop_right")

func _on_up_button_pressed():
	emit_signal("move_up")

func _on_up_button_released():
	emit_signal("stop_up")

func _on_down_button_pressed():
	emit_signal("move_down")

func _on_down_button_released():
	emit_signal("stop_down")

func _on_fire_button_pressed():
	emit_signal("fire") 
