class_name Npc
extends CharacterBody2D

@export var actions: Dictionary[Marker2D, float]= {}
@export var sprite_dead: Texture

@onready var detection_area: Area2D = $DetectionArea

func get_avoidance_vector() -> Vector2:
	var avoid := Vector2.ZERO
	
	for body in detection_area.get_overlapping_bodies():
		if body == self:
			continue
		var away = global_position - body.global_position
		var dist = away.length()
		if dist > 0.0:
			avoid += away.normalized() / dist
	return avoid

func _on_area_of_vision_body_entered(body: Node2D) -> void:
	print("Uh oh! Stop doing naughty stuff!")
