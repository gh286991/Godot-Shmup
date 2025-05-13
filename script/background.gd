extends Node2D

const STAR_SPEED = 100.0  # 增加速度

func _ready():
	# 初始化星星位置
	for star in $Stars.get_children():
		star.position.y = randf_range(0, 960)

func _process(delta):
	# 移動所有星星
	for star in $Stars.get_children():
		star.position.y += STAR_SPEED * delta  # 改為向上移動
		
		# 如果星星超出螢幕底部，將其移到頂部
		if star.position.y > 980:  # 修改判斷條件
			star.position.y = -20  # 從頂部重新開始
			star.position.x = randf_range(0, 480)
			
	# 根據速度調整星星的透明度，創造出速度感
	for star in $Stars.get_children():
		var alpha = 0.3 + (STAR_SPEED / 200.0) * 0.7
		star.modulate.a = alpha 
