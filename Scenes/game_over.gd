extends Control

@export var back_scene : PackedScene
@export var main_menu_scene : PackedScene

func _ready() -> void:
	$CenterContainer/VBoxContainer/ScoreLabel.text = str("Score: ", Score.score)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("continue"):
		Score.score = 0
		get_tree().change_scene_to_packed(back_scene)
	elif Input.is_action_just_pressed("escape"):
		Score.score = 0
		get_tree().change_scene_to_packed(main_menu_scene)
