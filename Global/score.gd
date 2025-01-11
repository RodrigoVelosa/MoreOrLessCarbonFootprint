extends Node

var score : int
var highscore : int

var score_file_path = "Data/score_data.json"

var json_data : Dictionary

func _ready() -> void:
	json_data = JSON.parse_string(FileAccess.get_file_as_string(score_file_path))
	highscore = json_data.highscore

func increment() -> void:
	score += 1
	
	if score > highscore:
		highscore = score
		
		var json_data = JSON.parse_string(FileAccess.get_file_as_string(score_file_path))
		json_data.highscore = highscore
		
		var file = FileAccess.open(score_file_path, FileAccess.WRITE)
		file.store_line(JSON.stringify(json_data))
