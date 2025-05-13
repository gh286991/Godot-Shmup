extends Node2D

var score: int = 0
var player_speed: float = 300.0
var player_velocity: Vector2 = Vector2.ZERO

func _ready():
	update_score_label()
	$VirtualJoystick.move_left.connect(_on_move_left)
	$VirtualJoystick.move_right.connect(_on_move_right)
	$VirtualJoystick.move_up.connect(_on_move_up)
	$VirtualJoystick.move_down.connect(_on_move_down)
	$VirtualJoystick.fire.connect(_on_fire)
	$VirtualJoystick.stop_left.connect(_on_stop_left)
	$VirtualJoystick.stop_right.connect(_on_stop_right)
	$VirtualJoystick.stop_up.connect(_on_stop_up)
	$VirtualJoystick.stop_down.connect(_on_stop_down)

func _process(delta):
	if player_velocity != Vector2.ZERO:
		$Player.position += player_velocity * delta
		# 限制玩家在螢幕範圍內
		var viewport_rect = get_viewport_rect()
		$Player.position.x = clamp($Player.position.x, 0, viewport_rect.size.x)
		$Player.position.y = clamp($Player.position.y, 0, viewport_rect.size.y)

func _on_move_left():
	player_velocity.x = -player_speed

func _on_move_right():
	player_velocity.x = player_speed

func _on_move_up():
	player_velocity.y = -player_speed

func _on_move_down():
	player_velocity.y = player_speed

func _on_stop_left():
	if player_velocity.x < 0:
		player_velocity.x = 0

func _on_stop_right():
	if player_velocity.x > 0:
		player_velocity.x = 0

func _on_stop_up():
	if player_velocity.y < 0:
		player_velocity.y = 0

func _on_stop_down():
	if player_velocity.y > 0:
		player_velocity.y = 0

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
