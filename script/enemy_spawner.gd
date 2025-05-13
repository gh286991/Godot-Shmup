extends Node2D

var enemy_scene = preload("res://Scenes/enemy.tscn")
var spawn_timer = 0
var spawn_interval = 2.0  # 每2秒生成一個敵人

func _ready():
	pass

func _process(delta):
	spawn_timer += delta
	if spawn_timer >= spawn_interval:
		spawn_timer = 0
		spawn_enemy()

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2(
		randf_range(50, 550),  # 隨機X位置
		-50  # 從螢幕頂部生成
	)
	add_child(enemy) 