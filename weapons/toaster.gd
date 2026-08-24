extends Node2D

@onready var bullet_scene = preload("res://Bullets/toaster_bullet.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Use"):
		look_at(get_global_mouse_position())
		var bullet = bullet_scene.instantiate()
		bullet.global_position = Vector2(global_position.x, global_position.y - 20)
		bullet.rotation = rotation
		add_sibling(bullet)
		queue_free()
