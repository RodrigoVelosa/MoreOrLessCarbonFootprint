extends Node2D

func reset() -> void:
	$ScoreContainer/HighscoreLabel.text = str("Highscore: ", Score.highscore)
	$ScoreContainer/CurrentScoreLabel.text = str("Score: ", Score.score)

func increment() -> void:
	Score.increment()
	reset()
