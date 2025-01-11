extends Control

@export var play_scene : PackedScene

func _ready() -> void:
	$MarginContainer/CurentHighscoreLabel.text = str("Current highscore: ", Score.highscore)

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(play_scene)


func _on_quit_pressed() -> void:
	get_tree().quit()
