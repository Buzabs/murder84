class_name Camera
extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.room_entered.connect(_on_room_entered)

func _on_room_entered(room_id: String):
	for child in get_parent().get_children():
		if child is Room:
			if child.room_id == room_id:
				global_position = child.room_center.global_position
	
