extends Control

func _ready():
	$StartButton.pressed.connect(_on_start_button_pressed)
	$QuitButton.pressed.connect(_on_quit_button_pressed)

func _on_start_button_pressed():
	# 切換到遊戲場景
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_quit_button_pressed():
	# 退出遊戲
	get_tree().quit() 
