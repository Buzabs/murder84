class_name Bullet
extends Node2D

@export var speed: int
@export var lifespan: int

func _ready() -> void:
	rotation = randf_range(-1,1)

func _process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * speed
	lifespan -= 1
	if lifespan <= 0:
		queue_free()

		
