extends Area2D

const SPEED = 500.0

func _process(delta):
	position.y -= SPEED * delta
	
	# 當子彈超出螢幕上緣時自動銷毀
	if position.y < -20:
		queue_free() 