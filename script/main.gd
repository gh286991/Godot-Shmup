extends Node2D

var score: int = 0
var player_speed: float = 300.0
var player_velocity: Vector2 = Vector2.ZERO

func _ready():
	update_score_label()
	# 判斷是否為觸控裝置，若不是則隱藏虛擬搖桿
	if not DisplayServer.is_touchscreen_available():
		$VirtualJoystick.visible = false
	$VirtualJoystick.move_vector.connect(_on_move_vector)
	$VirtualJoystick.fire.connect(_on_fire)

func _process(delta):
	if player_velocity != Vector2.ZERO:
		$Player.position += player_velocity * delta
		# 限制玩家在螢幕範圍內
		var viewport_rect = get_viewport_rect()
		$Player.position.x = clamp($Player.position.x, 0, viewport_rect.size.x)
		$Player.position.y = clamp($Player.position.y, 0, viewport_rect.size.y)

func _on_move_vector(direction: Vector2):
	player_velocity = direction * player_speed

func _on_fire():
	if $Player.has_method("shoot"):
		$Player.shoot()

func add_score(amount: int):
	print("add_score called, amount: ", amount)
	score += amount
	update_score_label()

func update_score_label():
	print($ScoreLabel)
	$ScoreLabel.text = "Score: %d" % score 
