extends Button

var product : Node

func _ready() -> void:
	product = get_parent()

func _on_button_up() -> void:
	
	get_node("/root/GameScene").product_chose(product)
