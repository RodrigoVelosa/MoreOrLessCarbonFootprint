extends Node2D

@export var footprint : float
@export var visual : Texture2D
@export var product_name : String

var footprint_label_correct : Label
var footprint_label_wrong : Label
var name_label : Label

func _ready() -> void:
	footprint_label_correct = get_node("FootprintLabelCorrect")
	footprint_label_wrong = get_node("FootprintLabelWrong")
	name_label = get_node("Name")
	

func reset() -> void:
	$Sprite.texture = visual
	
	footprint_label_correct.text = str(footprint, " Kg CO₂e/kg")
	footprint_label_wrong.text = str(footprint, " Kg CO₂e/kg")
	
	footprint_label_correct.hide()
	footprint_label_wrong.hide()
	
	name_label.text = product_name
