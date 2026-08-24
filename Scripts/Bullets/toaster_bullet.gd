extends Node2D

@export var sprite: Sprite2D
@export var speed: int

func _process(delta: float) -> void:
	sprite.rotation = -rotation
	global_position += Vector2.RIGHT.rotated(rotation) * speed
	
