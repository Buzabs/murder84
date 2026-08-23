class_name Room
extends Node2D

@export var room_id: String = " "
@onready var room_center: Marker2D = $RoomCenter

func _on_area_2d_body_entered(body: Node2D) -> void:
	SignalBus.room_entered.emit(room_id)
	print("entered room", room_id)
