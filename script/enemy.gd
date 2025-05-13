extends Node2D

var speed = 200
var health = 2

func _ready():
	pass

func _process(delta):
	position.y += speed * delta
	
	# 如果敵人超出螢幕底部，則刪除
	if position.y > 1000:
		queue_free()

func take_damage():
	health -= 1
	if health <= 0:
		# 通知主場景加分
		var main = get_tree().get_current_scene()
		if main.has_method("add_score"):
			main.add_score(1)
		queue_free()

func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		if area.has_method("take_damage"):
			area.take_damage()
		queue_free()  # 敵人撞到玩家後消失
	elif area.is_in_group("bullet"):
		take_damage()
		area.queue_free()  # 刪除子彈 
