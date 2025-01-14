extends Node

@export var product1 : Node
@export var product2 : Node
@export var score : Node

var correct_product : Node
var wrong_product : Node

var json_data : Dictionary

var game_over_scene : PackedScene = load("res://Scenes/game_over.tscn")

func _ready() -> void:
	Global.state = "choosing"
	json_data = JSON.parse_string(FileAccess.get_file_as_string("Data/product_data.json"))
	
	score.reset()
	
	new_products()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("continue"):
		if Global.state == "chose":
			new_products()
		elif Global.state == "game_over":
			process_game_over()

func product_chose(product):
	if Global.state != "choosing":
		return
	
	Global.state = "chose"
	correct_product.footprint_link_correct.show()
	wrong_product.footprint_link_wrong.show()
	
	if (product == correct_product):
		$SuccessSprite.visible = true
		$SuccessSound.play()
		$MarginContainer/ContinueLabel.visible = true
		score.increment()
	else:
		$FailureSound.play()
		$FailureSprite.visible = true
		Global.state = "awaiting_game_over"
		await get_tree().create_timer(1.5).timeout
		Global.state = "game_over"
		$MarginContainer/ContinueLabel.visible = true
		
func new_products() -> void:
	var range = len(json_data.products) - 1
	var product1_i = randi_range(0, range)
	var product2_i = randi_range(0, range)
	
	while product1_i == product2_i:
		product2_i = randi_range(0, range)
	
	var product1_data = json_data.products[product1_i]
	var product2_data = json_data.products[product2_i]
	
	product1.footprint = product1_data.footprint
	product2.footprint = product2_data.footprint
	
	product1.product_name = product1_data.name
	product2.product_name = product2_data.name
	
	product1.external_link = product1_data.link
	product2.external_link = product2_data.link
	
	var image_path = "res://ProductImages/"

	product1.visual = load(str(image_path, product1_data.image, ".webp"))
	product2.visual = load(str(image_path, product2_data.image, ".webp"))
	
	product1.reset()
	product2.reset()
	
	process_correct_product()
	
	$SuccessSprite.visible = false
	$FailureSprite.visible = false
	$MarginContainer/ContinueLabel.visible = false
	
	Global.state = "choosing"

func process_correct_product() -> void:
	if product1.footprint >= product2.footprint:
		correct_product = product2
		wrong_product = product1
	else:
		correct_product = product1
		wrong_product = product2
	
func process_game_over() -> void:
	get_tree().change_scene_to_packed(game_over_scene)
