class_name Shotgun
extends Node2D

@onready var bullet_scene = preload("res://Bullets/bullet.tscn")
@export var marker2d: Marker2D
@export var timer: Timer
var can_shoot_bull = true

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if cos(rotation) < 0:
		scale = Vector2(1, -1)
	else:
		scale = Vector2(1, 1)
	if Input.is_action_just_pressed("Use") and can_shoot_bull:
		for i in range(10):
			var bullet = bullet_scene.instantiate()
			bullet.global_position = marker2d.position
			add_child(bullet)
		timer.start()
		can_shoot_bull = false


func _on_timer_timeout() -> void:
	can_shoot_bull = true
