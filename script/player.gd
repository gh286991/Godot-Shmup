extends Area2D

const SPEED = 300.0
const BULLET_SCENE = preload("res://Scenes/bullet.tscn")
var health = 3  # 玩家生命值

func _process(delta):
	# 獲取水平和垂直方向的輸入
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	
	# 計算移動向量
	var movement = Vector2(direction_x, direction_y)
	
	# 如果有移動輸入，則更新位置
	if movement != Vector2.ZERO:
		position += movement.normalized() * SPEED * delta
		
	# 限制玩家在螢幕範圍內
	position.x = clamp(position.x, 0, get_viewport_rect().size.x)
	position.y = clamp(position.y, 0, get_viewport_rect().size.y)
	
	# 處理射擊
	if Input.is_action_just_pressed("ui_accept"):  # 使用空白鍵射擊
		shoot()

func shoot():
	var bullet = BULLET_SCENE.instantiate()
	bullet.position = position
	get_parent().add_child(bullet)
"res://Scenes/airplane.png"

func take_damage():
	health -= 1
	if health <= 0:
		queue_free()  # 玩家死亡
