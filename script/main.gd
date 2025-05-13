extends Node2D

var score: int = 0

func _ready():
	update_score_label()

func add_score(amount: int):
	print("add_score called, amount: ", amount)
	score += amount
	update_score_label()

func update_score_label():
	print($ScoreLabel)
	$ScoreLabel.text = "Score: %d" % score 