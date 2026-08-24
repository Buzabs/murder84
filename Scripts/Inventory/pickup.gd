extends Area2D

@export var item_to_give: ItemData

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("add_to_inventory"):
		body.add_to_inventory(item_to_give)
		queue_free()
