extends Node2D

@export var footprint : float
@export var visual : Texture2D
@export var product_name : String
@export var external_link : String

var footprint_link_correct : LinkButton
var footprint_link_wrong : LinkButton
var name_label : Label

func _ready() -> void:
	footprint_link_correct = get_node("FootprintLinkCorrect")
	footprint_link_wrong = get_node("FootprintLinkWrong")
	name_label = get_node("Name")
	

func reset() -> void:
	$Sprite.texture = visual
	
	footprint_link_correct.text = str(footprint, " Kg CO₂e/kg")
	footprint_link_wrong.text = str(footprint, " Kg CO₂e/kg")
	
	footprint_link_correct.uri = external_link
	footprint_link_wrong.uri = external_link
	
	footprint_link_correct.hide()
	footprint_link_wrong.hide()
	
	name_label.text = product_name
